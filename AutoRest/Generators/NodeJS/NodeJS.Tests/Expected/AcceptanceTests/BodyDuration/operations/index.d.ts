/*
 * Copyright (c) Microsoft Corporation. All rights reserved.
 * Licensed under the MIT License. See License.txt in the project root for
 * license information.
 * 
 * Code generated by Microsoft (R) AutoRest Code Generator 0.12.0.0
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
*/

import { RequestOptions, WebResource } from "ms-rest";
import * as stream from "stream";
import * as models from "../models";


/**
 * @class
 * Duration
 * __NOTE__: An instance of this class is automatically created for an
 * instance of the AutoRestDurationTestService.
 */
export interface Duration {

    /**
     * Get null duration value
     *
     * @param {object} [options]
     *
     * @param {object} [options.customHeaders] headers that will be added to
     * request
     *
     * @param {function} callback
     *
     * @returns {function} callback(err, result, request, response)
     *
     *                      {Error}  err        - The Error object if an error occurred, null otherwise.
     *
     *                      {moment.duration} [result]   - The deserialized result object.
     *
     *                      {object} [request]  - The HTTP Request object if an error did not occur.
     *
     *                      {stream} [response] - The HTTP Response stream if an error did not occur.
     */
    getNull(options: RequestOptions, callback: (err: Error, result: moment.Duration, request: WebResource, response: stream.Readable) => void): void;

    /**
     * Put a positive duration value
     *
     * @param {moment.duration} durationBody
     * 
     * @param {object} [options]
     *
     * @param {object} [options.customHeaders] headers that will be added to
     * request
     *
     * @param {function} callback
     *
     * @returns {function} callback(err, result, request, response)
     *
     *                      {Error}  err        - The Error object if an error occurred, null otherwise.
     *
     *                      {null} [result]   - The deserialized result object.
     *
     *                      {object} [request]  - The HTTP Request object if an error did not occur.
     *
     *                      {stream} [response] - The HTTP Response stream if an error did not occur.
     */
    putPositiveDuration(durationBody: moment.Duration, options: RequestOptions, callback: (err: Error, result: void, request: WebResource, response: stream.Readable) => void): void;

    /**
     * Get a positive duration value
     *
     * @param {object} [options]
     *
     * @param {object} [options.customHeaders] headers that will be added to
     * request
     *
     * @param {function} callback
     *
     * @returns {function} callback(err, result, request, response)
     *
     *                      {Error}  err        - The Error object if an error occurred, null otherwise.
     *
     *                      {moment.duration} [result]   - The deserialized result object.
     *
     *                      {object} [request]  - The HTTP Request object if an error did not occur.
     *
     *                      {stream} [response] - The HTTP Response stream if an error did not occur.
     */
    getPositiveDuration(options: RequestOptions, callback: (err: Error, result: moment.Duration, request: WebResource, response: stream.Readable) => void): void;

    /**
     * Get an invalid duration value
     *
     * @param {object} [options]
     *
     * @param {object} [options.customHeaders] headers that will be added to
     * request
     *
     * @param {function} callback
     *
     * @returns {function} callback(err, result, request, response)
     *
     *                      {Error}  err        - The Error object if an error occurred, null otherwise.
     *
     *                      {moment.duration} [result]   - The deserialized result object.
     *
     *                      {object} [request]  - The HTTP Request object if an error did not occur.
     *
     *                      {stream} [response] - The HTTP Response stream if an error did not occur.
     */
    getInvalid(options: RequestOptions, callback: (err: Error, result: moment.Duration, request: WebResource, response: stream.Readable) => void): void;
}