attribute vec3 aVertexPosition;
attribute mat3 aPrecomputeLT;

uniform mat3 uPrecomputeLR;
uniform mat3 uPrecomputeLG;
uniform mat3 uPrecomputeLB;
uniform mat4 uModelMatrix;
uniform mat4 uViewMatrix;
uniform mat4 uProjectionMatrix;

varying highp vec3 vColor;

void main(void)
{
    gl_Position = uProjectionMatrix * uViewMatrix * uModelMatrix * vec4(aVertexPosition, 1.0);
    vColor.r = dot(aPrecomputeLT[0], uPrecomputeLR[0]) +
                dot(aPrecomputeLT[1], uPrecomputeLR[1]) +
                dot(aPrecomputeLT[2], uPrecomputeLR[2]);
    vColor.g = dot(aPrecomputeLT[0], uPrecomputeLG[0]) +
                dot(aPrecomputeLT[1], uPrecomputeLG[1]) +
                dot(aPrecomputeLT[2], uPrecomputeLG[2]);
    vColor.b = dot(aPrecomputeLT[0], uPrecomputeLB[0]) +
                dot(aPrecomputeLT[1], uPrecomputeLB[1]) +
                dot(aPrecomputeLT[2], uPrecomputeLB[2]);
}