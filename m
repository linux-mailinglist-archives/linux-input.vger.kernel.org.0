Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28E762ED0E9
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 14:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbhAGNhV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 08:37:21 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:33198 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbhAGNhU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 08:37:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610026468;
        s=strato-dkim-0002; d=florianmaerkl.de;
        h=In-Reply-To:Date:Message-ID:From:Subject:References:Cc:To:From:
        Subject:Sender;
        bh=6booAnaKm3EE+TaZZg5Y1kwx+X4w8GuXyCiOf58PRCo=;
        b=tCQPs+grHlZVBpbwW+sW6n1U3HKw4U23doKwy6lQU74k7j5TyQXaTcOdpD1gIf5rOy
        a/Y53Kw7is24XG5I+OHLr5u5obxwzxofryOBY/w4N1xwgO2T9ASIAlj+mhwTIxgCxQU/
        nwW3n/8VNZvI9PWxGCjY8IaQxkTn0AxiJwu/BcGWC93vICd4Bhu8pgKgH51rxYBXlTht
        oSoJhw7Jxv3y2IFRRyGHG+hHVqgZgm8QOfqloIwiFR2ryaet+RczZY1zHs0n3bspKQ3h
        tEHaHkOIVcNrksBhglbOYoFHDKFTQ4wi5ouoT/nBIvCfHpiYftmGwUS2aBnjHnvo3WEh
        CaWQ==
X-RZG-AUTH: ":JWICemCud/DxHoRx2yg49oX0O/FjOgMCY83ji5SkMM6Tf/x8LI/wkWHHWmeAjaMTF/tut4Ypwww="
X-RZG-CLASS-ID: mo00
Received: from [192.168.1.22]
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id L09737x07DYN1UK
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 7 Jan 2021 14:34:23 +0100 (CET)
To:     roderick@gaikai.com
Cc:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, lzye@google.com,
        roderick.colenbrander@sony.com
References: <20210102223109.996781-6-roderick@gaikai.com>
Subject: Re: [PATCH v2 05/13] HID: playstation: add DualSense accelerometer
 and gyroscope support.
From:   =?UTF-8?Q?Florian_M=c3=a4rkl?= <linux@florianmaerkl.de>
Message-ID: <16e2def9-2d88-45f2-1a76-4de209f1af78@florianmaerkl.de>
Date:   Thu, 7 Jan 2021 14:34:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210102223109.996781-6-roderick@gaikai.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> +static struct input_dev *ps_sensors_create(struct hid_device *hdev, int accel_range, int accel_res,
> +		int gyro_range, int gyro_res)
> +{
> +	struct input_dev *sensors;
> +	int ret;
> +
> +	sensors = ps_allocate_input_dev(hdev, "Motion Sensors");
> +	if (IS_ERR(sensors))
> +		return ERR_PTR(-ENOMEM);
> +
> +	__set_bit(INPUT_PROP_ACCELEROMETER, sensors->propbit);
> +
> +	/* Accelerometer */
> +	input_set_abs_params(sensors, ABS_X, -accel_range, accel_range, 16, 0);
> +	input_set_abs_params(sensors, ABS_Y, -accel_range, accel_range, 16, 0);
> +	input_set_abs_params(sensors, ABS_Z, -accel_range, accel_range, 16, 0);
> +	input_abs_set_res(sensors, ABS_X, accel_res);
> +	input_abs_set_res(sensors, ABS_Y, accel_res);
> +	input_abs_set_res(sensors, ABS_Z, accel_res);
> +
> +	/* Gyroscope */
> +	input_set_abs_params(sensors, ABS_RX, -gyro_range, gyro_range, 16, 0);
> +	input_set_abs_params(sensors, ABS_RY, -gyro_range, gyro_range, 16, 0);
> +	input_set_abs_params(sensors, ABS_RZ, -gyro_range, gyro_range, 16, 0);
> +	input_abs_set_res(sensors, ABS_RX, gyro_res);
> +	input_abs_set_res(sensors, ABS_RY, gyro_res);
> +	input_abs_set_res(sensors, ABS_RZ, gyro_res);
> +
> +	ret = input_register_device(sensors);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return sensors;
> +}

The bits for EV_MSC/MSC_TIMESTAMP events are not set here, hence
timestamp events would not delivered:

	__set_bit(EV_MSC, sensors->evbit);
	__set_bit(MSC_TIMESTAMP, sensors->mscbit);


>  static int dualsense_get_mac_address(struct dualsense *ds)
>  {
>  	uint8_t *buf;
> @@ -319,6 +469,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
>  	struct dualsense_input_report *ds_report;
>  	uint8_t battery_data, battery_capacity, charging_status, value;
>  	int battery_status;
> +	uint16_t sensor_timestamp;

This uint16_t variable overflows just after a few events. Since the
timestamp from the controller is 32bit and the event value too, I assume
this should be too.

-- 
Florian Märkl
https://metallic.software
