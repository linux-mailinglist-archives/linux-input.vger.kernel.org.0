Return-Path: <linux-input+bounces-12810-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B458EAD5349
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 13:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7503D163772
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 11:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2B62E6106;
	Wed, 11 Jun 2025 11:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oTH4pTqF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8EB2E6115
	for <linux-input@vger.kernel.org>; Wed, 11 Jun 2025 11:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749640298; cv=none; b=seRWNO8l/Ws9IHxSWZhqQ5Hk5TSJzmMhS3jjiN+s5y9iekIiXJEEdBtWqQ7vbgMiJoh641S1v1jZ6cXCJg7Ru6G5GzLDpD5t4zghM4ROPJBzQ1Mb83jBdLkMv5noTQcjMEzhQ85nkPQJhz9JT/arU0zgvlKCAYYxwdAfK6u2v14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749640298; c=relaxed/simple;
	bh=MUe+/ATKf/kEnLb5U7LfslO+vIEY4chB2ROF2rC7r84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WqqG6EBwGqoP6Rdql7gsAHuN+NZdFbDNMbW3T3UsxvMMmE1PBAIJGhJ78P72568B658lm0GtSBw48Hl91ybwH3D53A8dQpaKqZh9bxjSQc/d/e/ToreBvjJsl2VXrcLp2YwLkFXxqGLoh2rwXEl1wx/MXvfRGUGwLiZYMWVM7J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oTH4pTqF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so81201675e9.1
        for <linux-input@vger.kernel.org>; Wed, 11 Jun 2025 04:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749640294; x=1750245094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0V3NbDSLa3XQAzoO06/Uqe3bpI8rUYw53fVUptdD+0s=;
        b=oTH4pTqFTtpdicoxOPE4PJISo5mUMpjT4wYK5ipVjn4VuyOTERR9cCdC0R8VQkjALA
         vhnXdgqQdM3iJ01wLwbi2WnUSe43lj8BLyJA1jqA0b46QfyEWrVTlUA8vf8qadAdY1DQ
         dOdfIXLH+XS9MX8xThh/SAscqqzhwovMu+HXWirYXQnKCk28T5ezBLiEEKmukYmnw37h
         6SnBYjEvXQwcqkYu6V1CzukYrf+Xo8EobEMuQBC84clF5od01Zu18VWpQj6jMCMPueKD
         XmtUeJyByEzMnH4bwWi2k1l/fssB3UXcvjP6k7rFwL5oq/FxvR99iB/yYBpC6as2+7fG
         Xo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749640294; x=1750245094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0V3NbDSLa3XQAzoO06/Uqe3bpI8rUYw53fVUptdD+0s=;
        b=QpVRn74ayT/N+xlot7ppDaXA0feoKNo8ZGJ6NnR1xT1tHwNzX3IQsN9WUmQ0U3Beg/
         IbEpPsMl2EEaqldUYUOTSW0PXuHUsSYTg5cRMbvKqS40LCRD7CP64kcWxDAEPTiOf0rB
         CCFphR6GS0355CqNkNiN4ZwlJEerO07JZMNSOuMsC1BHcxqo/3iQyF8R5/SpC8mEp+PW
         syWOX24o2nEgvMabEdOT3+ojYr6infhvoApQm7FwxSJIb+5s9V7ed71KSTRz5O0UYFxB
         4iBKebE1toPNHtjO7KHS0ZfYpfadjf+ZvjyQoRIh98YaX6rFZI36B6n8N+/Vl1/VhAiB
         8llA==
X-Gm-Message-State: AOJu0YzVOGB8hQr4Px2kSqVtwgVjUB7dB6j2Bj7pTaSis9lQj5llXm3g
	7C1QQNuJOujOWJIHUS2sfSjvP427YiQbyLFjbGqFc92HXG7NeUSuMf2cAfTVfeJ6H3E=
X-Gm-Gg: ASbGncuMX076HDjUGKZoSZHTZQ9Ff5KeQ+qdCbJUMFlzqAJS9YhpQlawdQpIPVJopdo
	u9lEE5X1JrFIV0nZsbfRzBlIYFb2t7MHqpLj+WRQs3DPoqwNLJQ97Tibluoac5WW/elDEO9E1Dn
	q6agoMBphIsgoNq40mVdf4Q0St4AAcFO3pY/B51oIahmy66wILi9XHOl3x7xcPdvfLbY8tulSJL
	TZcQ3e9M4gc0/J4Loi7We3gQwn5NQsSQMk07YaeJp896VyuhPE/yvisHo0L5UPSkdZah5yTdeM2
	Pi2hHdyw5H8oHHJJncR/EAVP0FPuUAeea4H4Q8cOeKGHTug0iG/Nz2eCggJ7uIBoZaf9O+T1
X-Google-Smtp-Source: AGHT+IHhx/dxetkj6r6wrKRU0rbLoNqvCtKGlxRTYls+jmNCkDknGnrm9z3NA9HEadonCRujjQxj8A==
X-Received: by 2002:a05:600c:3d13:b0:450:ddb7:ee4d with SMTP id 5b1f17b1804b1-453248cb4c2mr24029765e9.24.1749640294473;
        Wed, 11 Jun 2025 04:11:34 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5322aa3c0sm14779701f8f.22.2025.06.11.04.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 04:11:33 -0700 (PDT)
Message-ID: <c8928e44-894d-4b67-aaf0-0bd460d37678@linaro.org>
Date: Wed, 11 Jun 2025 12:11:32 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] firmware: add Exynos ACPM protocol driver
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-input@vger.kernel.org
References: <aElHlTApXj-W_o1r@stanley.mountain>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <aElHlTApXj-W_o1r@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/11/25 10:08 AM, Dan Carpenter wrote:
> Hello Tudor Ambarus,
> 
> Commit a88927b534ba ("firmware: add Exynos ACPM protocol driver")
> from Feb 13, 2025 (linux-next), leads to the following Smatch static
> checker warning:
> 
> 	drivers/input/misc/tps65219-pwrbutton.c:129 tps65219_pb_remove()
> 	warn: passing positive error code '1-255' to 'ERR_PTR'
> 
> drivers/input/misc/tps65219-pwrbutton.c
>     120 static void tps65219_pb_remove(struct platform_device *pdev)
>     121 {
>     122         struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
>     123         int ret;
>     124 
>     125         /* Disable interrupt for the pushbutton */
>     126         ret = regmap_set_bits(tps->regmap, TPS65219_REG_MASK_CONFIG,
>     127                               TPS65219_REG_MASK_INT_FOR_PB_MASK);
>     128         if (ret)
> --> 129                 dev_warn(&pdev->dev, "Failed to disable irq (%pe)\n", ERR_PTR(ret));
>     130 }
> 
> The problem is:
> 
> drivers/firmware/samsung/exynos-acpm-pmic.c
>    208  int acpm_pmic_update_reg(const struct acpm_handle *handle,
>    209                           unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
>    210                           u8 value, u8 mask)
>    211  {
>    212          struct acpm_xfer xfer;
>    213          u32 cmd[4] = {0};
>    214          int ret;
>    215  
>    216          acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
>    217          acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
>    218  
>    219          ret = acpm_do_xfer(handle, &xfer);
>    220          if (ret)
>    221                  return ret;
>    222  
>    223          return FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
>                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This acpm_pmic_update_reg() is called by sec_pmic_acpm_bus_reg_update_bits()
> via the (struct acpm_pmic_ops)->update_reg pointer.  This field get is
> returning a u8 value but I'm pretty sure we should be returning either
> zero or negative error codes.
> 

oh, yes, thanks for the report. The concern is valid, I'm adding it to
my todo list.

Cheers,
ta

