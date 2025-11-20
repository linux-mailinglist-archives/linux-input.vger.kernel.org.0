Return-Path: <linux-input+bounces-16248-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2EDC74042
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 13:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 740A84EBF05
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 12:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE21B33710F;
	Thu, 20 Nov 2025 12:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHXRs1DG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0578A1E5205
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 12:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763642430; cv=none; b=Y+M1ATQ5U6cLdLcVh8ppv9J9P+i5s2kQ+v/ZiJfnaaxijkSIBCC//0pEgzH9sFtTAlkKZpccuPpEhVHfbcMFiqAgV1brrTAQhOYu52WhU6xAUscP02EA2Ln4qhWD9msbBuafPTLwNqEsSF3h3hA1aZaE6Zydkb7/WCYluey0KL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763642430; c=relaxed/simple;
	bh=6c4cRy3Zt+26M0V9yPUthAH5nbncYQWVJvPsn3MoxpU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=k1aGxCgeQxTGRsTFuRkzjDYt/FoiV2/1SppR5jT/pQPgkaQD3A4PGhpML63yi/j5LJupeMsZuVLeHbtO6vgzSwct7tJh1cy2PVQojThUY0hbOXxaJJQj0EChLsYQ/3qU7REfjgvv2JhDOaS4uR3hQ5ppbQgaLXN7zP7RDJ95v1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHXRs1DG; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59584301f0cso960614e87.0
        for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 04:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763642427; x=1764247227; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pzg2sCD+z8dz/5RwfEPQO+EyhI/F//wVWhVIDxiz3ZU=;
        b=DHXRs1DGZBN28ZrS/hYXEOtwk4Mjm6bUup5P9XmTAflzs+dUNRmEpwrSQD6YC4mpyz
         51vL6ifNIZiKgUVQKzRGR7Jb2PgE+Bkbt9filYa1oRTyb2iDku75/em4T9PmkvAEz7Pp
         bN/VdTWxOtQw+kzsKfit+zDZDKoMRuQFIlw3N9DnWO9B7FNrN66/S0yidFSA6w6PjVcK
         JpBs4pCQGP06hycE44FNR+pu4w+dBKq3gSw8KELMXs3Kvp+TjwBtGCUzKJSyFa3M6XAw
         iNu/o/f+1tKdoYlL4Df0+VS5G5D/KZcEyUceBSBsKdtyDEqxVX0W4P+FCc5rsi/nfly1
         xGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763642427; x=1764247227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pzg2sCD+z8dz/5RwfEPQO+EyhI/F//wVWhVIDxiz3ZU=;
        b=hW7VrbNB4LlCjgw8k/7HEhF5QUdWQNdOdFJ3hGQOmvv38BZIGyRP4NnfuzFYb3z+SX
         aqmGHzEqLbdcgjQ0Iak4RvArcBeBxlOpntfvLUbvH8bE6KtjQmN4to/bAcM6o1/SpJeZ
         QPRwvIUPxBpEuktOa8a+xHmygD0aK+mwEeFNT/cBrLiFwNPBlD/7c8vBWDltKGdp9BpD
         oBeE4r9kgEvw18W4DTUdlzC8tNv+dokJ14by90tBK5OBN6hHTxKvA8GmBPb0qJ4KOn+y
         AQTYt+hFVwdv46hnIve1mMEcla1abGyAiP1lQmDPhWevLzalteTNp3ij6m6eYkHXprKn
         5BSA==
X-Gm-Message-State: AOJu0Yx3yepF1fiK+BFMDBE2V8cohtNlPt6xkaDqza62zOgzbsGibXGc
	LBZcCUZFaJ9U5Z4Ufp7fphQup6yQKP+n7FrTSoreBwNwYszJAoz7WCPjufkSa3MpqSiayj1vvRH
	rKpTZFgoKqtNuE2jqEqhO4yksfJLRAFQ=
X-Gm-Gg: ASbGncvqkDso0DZ4DP1OF0CYtmmgs3pmYt1hxyIGb+jJRrKdGYXkAfEs6/JTvPpz+iG
	YpLnoHB0IAIfYXJx/lhn/NfFG37fRNqm/5WoPkUpwLTlbhIybYQ57VvjzLp72JsiniDGO1pMIrY
	aZC5TTirrs3iReLmgVQxJWVy+tqg1o3bnVzMQTpZ8y54wFcHpIhuGCANljIBZRjSLvO5B+D2WvS
	uOOfJYm6CqR+Vz4nWEgCeXrO2Qs0pdWIANNe5qVeLPGXafi9Yv3vf/dixqVQvhZtYBCEkKbWNgB
	1+4YL/OsJ11HfFWUtBDZ+sSOEVw=
X-Google-Smtp-Source: AGHT+IG3rDfm21Q9TmwnA2UumMrdp2oTJ5u/6OJHvG1VY7rAeFbmPZC8/RImQBBFUFQLFVd4yxB/JU7wUwIW8EGt8uE=
X-Received: by 2002:a05:6512:1597:b0:594:4ebf:e6bd with SMTP id
 2adb3069b0e04-5969e2d9683mr987994e87.14.1763642426573; Thu, 20 Nov 2025
 04:40:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 20 Nov 2025 09:40:14 -0300
X-Gm-Features: AWmQ_bml2VWtRTjzc7b-8NTwhgetr9v4o426Nk443vrrkCrRjqFPRnimLKoHmtI
Message-ID: <CAOMZO5DhfCk9=uMONdwndrYgEXtYj6L6-mRbYyP-q5M4J9_DAg@mail.gmail.com>
Subject: ili2130: touchscreen-size-x/y DT properties are ignored, firmware
 reports 16384x16384 range
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, joe_hung@ilitek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I am working on an i.MX8MP-based system equipped with an Ilitek ILI2130
touch controller. The device tree contains:

    touchscreen@41 {
        compatible =3D "ilitek,ili2130";
        reg =3D <0x41>;
        interrupt-parent =3D <&gpio5>;
        interrupts =3D <13 IRQ_TYPE_EDGE_RISING>;
        reset-gpios =3D <&gpio5 12 GPIO_ACTIVE_LOW>;
        touchscreen-size-x =3D <800>;
        touchscreen-size-y =3D <480>;
        wakeup-source;
    };

The device probes correctly:

    $ cat /sys/bus/i2c/devices/2-0041/product_id
    product id: [2130], module: [ILI2130000000000]

    $ cat /sys/bus/i2c/devices/2-0041/firmware_version
    fw version: [0700.0000.0000.0000]

Using evtest, I see valid multitouch events. However, the reported
coordinate range is always 0=E2=80=9316383 for both X and Y, regardless of =
the
touchscreen-size-x/y values provided in the DT.

The ili2130 driver exposes screen_min_x/y and screen_max_x/y but these
are all initialized from firmware data. The DT properties appear to be
ignored for this model.

To make the touchscreen work correctly with Weston on an 800x480 panel,
I currently need the following hack:

    x =3D (raw_x * 25) >> 9;   /* 16384 * 25/512 =3D 800 */
    y =3D (raw_y * 15) >> 9;   /* 16384 * 15/512 =3D 480 */

--- a/drivers/input/touchscreen/ilitek_ts_i2c.c
+++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
@@ -194,8 +194,8 @@ static int ilitek_process_and_report_v6(struct
ilitek_ts_data *ts)

                id =3D buf[i * packet_len + 1] & 0x3F;

-               x =3D get_unaligned_le16(buf + i * packet_len + 2);
-               y =3D get_unaligned_le16(buf + i * packet_len + 4);
+               x =3D (get_unaligned_le16(buf + i * packet_len + 2) * 25) >=
> 9;
+               y =3D (get_unaligned_le16(buf + i * packet_len + 4) * 15) >=
> 9;

                if (x > ts->screen_max_x || x < ts->screen_min_x ||
                    y > ts->screen_max_y || y < ts->screen_min_y) {

Without this, the compositor receives coordinates in the 0=E2=80=9316383 ra=
nge.

My questions:

1. Should the ili2130 driver apply scaling based on
   touchscreen-size-x/y when firmware reports a fixed 14-bit coordinate
   range?

2. If yes, where should this scaling occur so that existing users of
   the ili2xxx family are not broken?
   - in ilitek_process_and_report_v6?
   - via input_set_abs_params() using adjusted min/max values?

3. Is the ILI2130 expected to report already-scaled coordinates
   normally, or is the 0=E2=80=9316383 range the intended firmware behavior=
?

I am happy to implement/test any proposed changes. Please let me know what =
the
correct approach would be for supporting panels whose resolution differs
from the firmware's coordinate space.

Thanks,

Fabio Estevam

