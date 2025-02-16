Return-Path: <linux-input+bounces-10082-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE33CA377DC
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2025 22:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D14BB3AC5BE
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2025 21:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DCE1A3166;
	Sun, 16 Feb 2025 21:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="evS/PdYj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A104C70
	for <linux-input@vger.kernel.org>; Sun, 16 Feb 2025 21:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739742145; cv=none; b=YHJgDtkwurahS8UeRA0d/qILUfHmFQpykHxL6e2PsHpmT2+72eiXl0zI4o9Qd35ew/lj1+bIdqRP8Pp6umSg1YyFUnVSkNewE9vvMa+fCG1ry6ZU+FFhyODrTTsrKYU6GjYbULx6in8DMuNPCcYHKODQPLx0rN9l+cASG7jVlS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739742145; c=relaxed/simple;
	bh=ha6dZVVCK5l9bFMMhI2k/dYCmTdi/I/+qAokkzBkTYY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BoFUYz8wAETe/nfYSZnXL2HI+sD4La427UqzhaFFvF+KccnVaCWVfUiecIM/jCG7o/c27rbkSf1YDrUuc2UjLsypwfVtF7KA3l6aafY+izCMqG8N7OwZUy7XtK4JD5rRVWtqJzrjUSOIyPABw/xQ322ZiF40LP9WgiDOE93r65A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=evS/PdYj; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaedd529ba1so442326466b.1
        for <linux-input@vger.kernel.org>; Sun, 16 Feb 2025 13:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739742141; x=1740346941; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4/QvOOOV4Uxel0V3yh5cGunuorCE3mmHh0hWgd4wjZg=;
        b=evS/PdYjg6f8oIjevUkdivC1+yvXYVaLRBy5nwNzmuNd5m1wj8X8f8jBCtUmJj37Hi
         Hxe2L/K6Scvqkq0241iwPhGChn/kNJhEvow73dFk+6Ceds09CYN3Xx/8fWuldzKvvlVd
         LwFVgpEGaJZxhgx6pymtHAK+LQPTtp1NEUPZyiHj4wZlg3RBLv4Ytu1zsSS8vqsHC5p0
         l952CNBmYW3imCfv0XzqrtW7/LqmftXZGlg/qFldrfjwEgSX0AkosMZTqTOwvtBhnygZ
         pty6kC9FVq9kezKxGU1IitV4B5RQlSY1u2smPUhGGFHcG+HG+CgDcnjXNzO9chkBveZ9
         DbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739742141; x=1740346941;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4/QvOOOV4Uxel0V3yh5cGunuorCE3mmHh0hWgd4wjZg=;
        b=tujFt7Pn3Tm2Rg6qsGfP3uO/hAJwrixPgODnppMOelBcp2VAu/WmYLDckNI8XQ8TSV
         FUSuJuO2JoCldwTsDiOgJEb25eQHSVDr3ukvbbydRWM4Mt7FKSaKbVFYwacfeKAMPqcd
         17gLd1RYXTVwIhd5SD61ulMRROzo/1gJofP3bZ87O0cbFp9iCySWGixDWWVQxrrZKlAI
         9eeV/Lb+SDxIeqPNoXMxzkfyr9/EoXEg95kcIfzc9w/NJjOI3ofZSuL3DaUkZEU/MZ1y
         ttdYHr/4GoLmXIH5BC8c7nJEcdWKZwo0Ps5tlgw3TucsSVZif6bA+WeYwvuSYIIuXVdW
         qoGQ==
X-Gm-Message-State: AOJu0Yy7JbC4daMlYk06XXGHkIBj+vIqB7+fd+HIdg8zsu7fVpZn0lch
	IZYfEga0a2Rd+nO2PAtHuM7dGrU/wJRrkMwL78a4IO8fIIaBpvEhhfyafNo/uzA=
X-Gm-Gg: ASbGncvj2An9N7Zs8v9KPDY4Ipfjl6so2IzdRIq+rzcqpiSfH/pEmgpugclKmmcVngK
	3XirgHaTVDBoX9kJsWYCjcXgx7qZOVULt91pLcX5nMNlcfvX0g+NLz4maGX8Kkv6wM1OPDnZvY5
	7Ei2JVSwuPUUirnuxxshflJnTGwexgLMnOazM5UDb3ylkqOpEa+5hh1o0xMBWowaPBXUjShnk2Y
	TLF/J7wCZSoBobX4/ttpk4wCLhA52KVNwKT74q64sAOOiSLS1ixi+Huhjsr2knutKzcN7wV37cZ
	PtUQtbSmgDW/8p2Tm+N2
X-Google-Smtp-Source: AGHT+IFRmkjwO/4YVTLs29gVHZFuo2ZEZ/dGhP5mA58CCWSHFqtmx8wHNhdBoNN7/HtoQIdyHWr3GQ==
X-Received: by 2002:a05:6402:42cc:b0:5de:4a8b:4c9c with SMTP id 4fb4d7f45d1cf-5e03618aa7emr20016042a12.32.1739742141486;
        Sun, 16 Feb 2025 13:42:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece2721d9sm6477983a12.56.2025.02.16.13.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 13:42:21 -0800 (PST)
Date: Mon, 17 Feb 2025 00:42:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aditya Garg <gargaditya08@live.com>
Cc: linux-input@vger.kernel.org
Subject: [bug report] HID: hid-appletb-kbd: add support for automatic
 brightness control while using the touchbar
Message-ID: <6263a1a2-4d50-41db-aa54-cfcb3e0523a4@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Aditya Garg,

Commit 93a0fc489481 ("HID: hid-appletb-kbd: add support for automatic
brightness control while using the touchbar") from Dec 31, 2024
(linux-next), leads to the following Smatch static checker warning:

	drivers/hid/hid-appletb-kbd.c:406 appletb_kbd_probe()
	warn: passing zero to 'dev_err_probe'

drivers/hid/hid-appletb-kbd.c
    372 static int appletb_kbd_probe(struct hid_device *hdev, const struct hid_device_id *id)
    373 {
    374         struct appletb_kbd *kbd;
    375         struct device *dev = &hdev->dev;
    376         struct hid_field *mode_field;
    377         int ret;
    378 
    379         ret = hid_parse(hdev);
    380         if (ret)
    381                 return dev_err_probe(dev, ret, "HID parse failed\n");
    382 
    383         mode_field = hid_find_field(hdev, HID_OUTPUT_REPORT,
    384                                     HID_GD_KEYBOARD, HID_USAGE_MODE);
    385         if (!mode_field)
    386                 return -ENODEV;
    387 
    388         kbd = devm_kzalloc(dev, sizeof(*kbd), GFP_KERNEL);
    389         if (!kbd)
    390                 return -ENOMEM;
    391 
    392         kbd->mode_field = mode_field;
    393 
    394         ret = hid_hw_start(hdev, HID_CONNECT_HIDINPUT);
    395         if (ret)
    396                 return dev_err_probe(dev, ret, "HID hw start failed\n");
    397 
    398         ret = hid_hw_open(hdev);
    399         if (ret) {
    400                 dev_err_probe(dev, ret, "HID hw open failed\n");
    401                 goto stop_hw;
    402         }
    403 
    404         kbd->backlight_dev = backlight_device_get_by_name("appletb_backlight");
    405                 if (!kbd->backlight_dev)
--> 406                         dev_err_probe(dev, ret, "Failed to get backlight device\n");
                                                   ^^^
s/ret/-EINVAL/?

Why is this indented an extra tab?

    407                 else {
    408                         backlight_device_set_brightness(kbd->backlight_dev, 2);
    409                         timer_setup(&kbd->inactivity_timer, appletb_inactivity_timer, 0);
    410                         mod_timer(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb_dim_timeout * 1000));
    411                 }
    412 

regards,
dan carpenter

