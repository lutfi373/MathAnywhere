import React from 'react';
import { Canvas } from '@react-three/fiber';
import { Environment, Lightformer } from '@react-three/drei';

export default function Lanyard() {
    return (
        <div className="lanyard-wrapper">
            <Canvas>
                <ambientLight intensity={Math.PI} />
                <Environment>
                    <Lightformer intensity={2} color="white" position={[0, -1, 5]} rotation={[0, 0, Math.PI / 3]} scale={[100, 0.1, 1]} />
                </Environment>
            </Canvas>
        </div>
    );
}