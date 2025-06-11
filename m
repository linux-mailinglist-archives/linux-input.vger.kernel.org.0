Return-Path: <linux-input+bounces-12804-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA68AD4F63
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 11:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD9293A4088
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 09:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA751624E5;
	Wed, 11 Jun 2025 09:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oOu2kQhU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD33622DFA2
	for <linux-input@vger.kernel.org>; Wed, 11 Jun 2025 09:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632926; cv=none; b=aWgLL4cJZ3+DRx/SGh/ySX08xiWRjVM79CPbh7XaA4bY1PvAGRVAh/MzYmfbDvg41xXR8jcwb1lGIhyBDlx+T+UASEBSDwWcubfXLStbja1PsEV6JWta6k5Gp9WhIOWpCup0WS7//P0y2OUI+AXjqYuWrzjWDD98BskbD7oDT/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632926; c=relaxed/simple;
	bh=IcLtpFsJ3LBlktPzcI6MTuTHghI0o9S/0Cm3PN+I3ow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qIanwo6MLTni3u80Rh5fmW3xgOvTljeMCrhcq5g6DM5HEze65B91C1+De47TMGIDVwypk/Ok7myeQwy7Gj/4CMZSm9rKTtQj3O3Tt9jMoU4bSxhJeDtU5rn4ryQ0fKXMT8La18dGzFHLQbJM5OyM2zNZd3wv59G0yVPxuqvnzjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oOu2kQhU; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a5096158dcso5398559f8f.1
        for <linux-input@vger.kernel.org>; Wed, 11 Jun 2025 02:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749632923; x=1750237723; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LmC5Lk7k0ZlXNERqyhShprsRgei8nLYuhUtGlffMqLo=;
        b=oOu2kQhU4kkIsnk4keFN+cMvq1ESAoV59fTzrR/Nni8w9faissHm4KKni/H5Skq/mN
         /gsg46SrgZSKDXn6KvFNUn/BiMSObVIxg1jDqJTI865PudDvIC84VkXBwoVUNCsQmHxk
         tPWLGVcVYD4X0x+4OLw7HxydKvBKhPLjKRL1vIuhxCqnVaO/pol3ch+6aO3dF+WLqtuB
         OI36Cz4rde+NtMxRhpFHfFn9nPlj8B0ZU2gDQujCw1A44FFngHiB6Io7tdO2ZiT/OgWc
         5qtumHi+mDRE4TgJY3tZdPVqFdfM6Ll6BV3zinxNZY0ovf0EoydlFdCgdDXUwVa3Y92u
         kqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749632923; x=1750237723;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LmC5Lk7k0ZlXNERqyhShprsRgei8nLYuhUtGlffMqLo=;
        b=iqioCkcAvczdveIgB05SZA69PycLG0ERq1a8MU20MWr7rerwA44IYN5DCwzrnUeIFJ
         JzTpFRFa5pEJvdZuv0J4B5y3gP/sA3EscS26ThAtoGZepZ2NXm1Ybq/HkeWxVU8cYzCY
         QL6gCp6KDZcDlNkFWXtyQelSA7LpVm5Pzb0iZty1ABU+tnn3FiiHfC/BFrtUEtYtopFu
         yUdkQOP9/58q1ic7vAXIsHGKdSBj9KM5tyu+pCLLJPW9hUCEqi6HpzMvRKBXdoZPBc6c
         midJf2JZ1uNBkmf2qfTniLBIygl6bD1wrQUERYE5PBewQ344nHx5Mx5NGUpQ/I0QqY9Y
         nYBA==
X-Gm-Message-State: AOJu0YyzyCNejtsMCHaRDb1XmJVWbyJIwB7YEYeDtGaxKLlK7QYMzbrD
	KRfv6FRmqO3bEWQo+pOPI7fpjGHffS2WUnU7WDTUTUGaGcYtwxfbYk0HSfQgvF8oJtvcSHrSho/
	W6y2k
X-Gm-Gg: ASbGncvvOS9NM0skseQGQMYDFrEcC2hIgqLzQZEJMf3WH4asvndAcJAALSlvcFowtjj
	v4qq0tlHhWe6nrB1WOXGAvHQyMq5mTBGwpUPtpcUnRjCLZbc/+wqm9ONe50zX2KqUMMhh/DYJb4
	NXAz7F9S+Ks9hRU7W7ThHKZ28wgrVXQemca1YUhYqWD1LeqieH7/gg0ZMXWCmovxnZKxWPBGPKX
	+xAIHHcUsj2wTzBBt/SfhVHv5RQWEXCAONBvGqyxPNVui8G/h23+xEP4yXWkjw9+27wN516plLj
	uNuJX+azk3WCMlSEyVPrDMXPOFb20/MAryT36uajK86G7IPlFecVS+8/+5MyQ+5okNs=
X-Google-Smtp-Source: AGHT+IGVKf+XOMe9PXe50+Ixul8J8t2LBX81aBv7LinHhqzstHyuJ/Q2x9WpW+22dDF2ReF2D+y0Nw==
X-Received: by 2002:a05:6000:288c:b0:3a4:eb92:39b6 with SMTP id ffacd0b85a97d-3a558a4277cmr1808640f8f.54.1749632923082;
        Wed, 11 Jun 2025 02:08:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45324fc3b52sm15423775e9.0.2025.06.11.02.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 02:08:42 -0700 (PDT)
Date: Wed, 11 Jun 2025 12:08:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-input@vger.kernel.org
Subject: [bug report] firmware: add Exynos ACPM protocol driver
Message-ID: <aElHlTApXj-W_o1r@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Tudor Ambarus,

Commit a88927b534ba ("firmware: add Exynos ACPM protocol driver")
from Feb 13, 2025 (linux-next), leads to the following Smatch static
checker warning:

	drivers/input/misc/tps65219-pwrbutton.c:129 tps65219_pb_remove()
	warn: passing positive error code '1-255' to 'ERR_PTR'

drivers/input/misc/tps65219-pwrbutton.c
    120 static void tps65219_pb_remove(struct platform_device *pdev)
    121 {
    122         struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
    123         int ret;
    124 
    125         /* Disable interrupt for the pushbutton */
    126         ret = regmap_set_bits(tps->regmap, TPS65219_REG_MASK_CONFIG,
    127                               TPS65219_REG_MASK_INT_FOR_PB_MASK);
    128         if (ret)
--> 129                 dev_warn(&pdev->dev, "Failed to disable irq (%pe)\n", ERR_PTR(ret));
    130 }

The problem is:

drivers/firmware/samsung/exynos-acpm-pmic.c
   208  int acpm_pmic_update_reg(const struct acpm_handle *handle,
   209                           unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
   210                           u8 value, u8 mask)
   211  {
   212          struct acpm_xfer xfer;
   213          u32 cmd[4] = {0};
   214          int ret;
   215  
   216          acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
   217          acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
   218  
   219          ret = acpm_do_xfer(handle, &xfer);
   220          if (ret)
   221                  return ret;
   222  
   223          return FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This acpm_pmic_update_reg() is called by sec_pmic_acpm_bus_reg_update_bits()
via the (struct acpm_pmic_ops)->update_reg pointer.  This field get is
returning a u8 value but I'm pretty sure we should be returning either
zero or negative error codes.

   224  }

regards,
dan carpenter

