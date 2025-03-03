Return-Path: <linux-input+bounces-10485-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B57EDA4B8DC
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 09:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E7D33B0442
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 08:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5E51EC016;
	Mon,  3 Mar 2025 08:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GI/oF148"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611491EEA57
	for <linux-input@vger.kernel.org>; Mon,  3 Mar 2025 08:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740989504; cv=none; b=lPvPQsKm48P5CXhbJq3Oo9Vyb96ULovl1QYjG1kTyz3HnJrZLZBMPh7gE+R/BpIGr9xD6wg/YUmerQSjNsa9InvZ11ShUmO28xzK2dOO94kav4BV3bI4UOKXqyGC3Z5FbOAjyTUU8XbTLUuo5aXt0pkX36/c9EfOHnJGc/UG6Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740989504; c=relaxed/simple;
	bh=bo6SWhus20Z8PeITEg45LQGY6JRfKDTdD/m++azp8wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rdolZfyKudvuLafsGNTdz98f4hb3QCGWIeZf5ol0/xssPrJIhHcfH3esBRl1dVbzhVaQcPIkeGfv9jwD3l1w5eNthy1DfNjckUG0r5HCPP/3XuiOJAkN3SkRn94moS0xcSgwXqwZDTmD8q5pApoEJtQaytvvBY8tP1vxkFtt6QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GI/oF148; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e535d16180so1439796a12.1
        for <linux-input@vger.kernel.org>; Mon, 03 Mar 2025 00:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740989500; x=1741594300; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c6fdAvZh2bGCiyabYLXWG/9c6YsoRAL+6HIMVFeU/NA=;
        b=GI/oF148jE8uRPywwWt+mK2pDRjYAkvKETpwDX5RwrszvqOoWpxvrOv2xNFAd0YrCK
         +8KO839X0+TQc3oe0qHfBX4Mf/iB6EnoWYd7ZI2zfesVD+IPlJ23k41mEt2mk0FURoU2
         t5bx67ynwphe1/VQJclLwOg+JQeYrN0KBs/stE6RA1mtzT2wOQz6PcxUGyEGQCaOji9Q
         EKLAzMMLYtb9qeSXLsjsiGFd6B0Gzj5Cptd/fUnbFqoiE1smsNXtTQ/DsEVs5eqADMMd
         25fMJgcIqbcKqZrTqSNszhHjoZE2Q862riiVdfIPGy2x8oFxvX13K+EEKNDqvj9jGk5z
         cvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740989500; x=1741594300;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6fdAvZh2bGCiyabYLXWG/9c6YsoRAL+6HIMVFeU/NA=;
        b=XFM1QLiewRnSJMzuaDNTcs4/aiK/vi5MQw8R6UObLAMRiTDjj7ZFkMrO35uRXK3oEy
         KeZ5D6OFGplqOqpPGNBoXb3647uH/XhuLGU5P6AHir2vCsD5lXd6De3AKEXHO8P189fT
         Pi99uyTRlBxE6cvZycIP5UQ+M9duzqik3S+2EtSKqDo5Zs49olY2o7w/rGBfCW/SNbRu
         4WsMdWBRBZ9LyeZaFnDd+t0i8/0pVcSRke/pM/vkma12XL3WewdrKNrHJllru9Z6hoYN
         91aPtZkT/cO/R9V0P/QSb+H56oJTU2Bn3zRZZ9YuWWm7XLN8ERPh3jo2ukmO+gOd1brW
         ojWg==
X-Gm-Message-State: AOJu0Yy7JFu9x3wT/XeSCYuuOSPp6O/gjZ94PrsjOuZevTvFIiXdq3f2
	L3UtT3JcaabFQUbbuOnzVKPgaHBVypZDz85Qci6au1zICyCXExo4IzIV6f6RMtY=
X-Gm-Gg: ASbGncviEHdx0EPuuAPp25QvNk8Eqy51Qwu/DNy/aclCDJv3zM6lKOyHt0Z2tifKHtP
	8Jvx6I/fMtKsDb74088k63wi3gk7S/I65JXl/RfLKHoi+bnh69ftHObiDQfBebMM6sbRq5FDIZK
	+26PBzvXC2UYmEQZ7xbvvF63onsP8PxCPwHwaq0cQ0O9uGqRO76BaL4FVA/f+iOJZaDoBQuRSS/
	3BOLycNS2oBeA0QoGZOn5LRuzWxUDNQOXJLk+rfEglOS/GZtCYaXpk3vQ//9aTYeJhnpXgTilwB
	j6yZtMIQJl0WNxj5nTswjsqqRXZT1qSXUGG9pylPzEThPemKhw==
X-Google-Smtp-Source: AGHT+IGtggIJkWTvwidvJ2WE8K/NgvCdxLx8XQDW26PiAwCDOMEGytbof9xLlSq0U/Z77d2E99vrPw==
X-Received: by 2002:a05:6402:3548:b0:5dc:7374:261d with SMTP id 4fb4d7f45d1cf-5e4d6ac4b81mr34513920a12.7.1740989499667;
        Mon, 03 Mar 2025 00:11:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c0dc601sm777446166b.68.2025.03.03.00.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:11:39 -0800 (PST)
Date: Mon, 3 Mar 2025 11:11:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [bug report] Input: atkbd - restore repeat rate when resuming
Message-ID: <cd3caca2-607e-4cf4-9262-bc5867b690a7@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[ This bug seems really ancient.  But so far as I can see it really is
  super old.  I'm not sure why it's only showing up now.  -dan ]

Hello Dmitry Torokhov,

Commit 3d0f0fa0cb55 ("Input: atkbd - restore repeat rate when
resuming") from Aug 4, 2006 (linux-next), leads to the following
Smatch static checker warning:

	drivers/input/keyboard/atkbd.c:604 atkbd_set_repeat_rate()
	warn: sleeping in atomic context

drivers/input/keyboard/atkbd.c
    583 static int atkbd_set_repeat_rate(struct atkbd *atkbd)
    584 {
    585         const short period[32] =
    586                 { 33,  37,  42,  46,  50,  54,  58,  63,  67,  75,  83,  92, 100, 109, 116, 125,
    587                  133, 149, 167, 182, 200, 217, 232, 250, 270, 303, 333, 370, 400, 435, 470, 500 };
    588         const short delay[4] =
    589                 { 250, 500, 750, 1000 };
    590 
    591         struct input_dev *dev = atkbd->dev;
    592         unsigned char param;
    593         int i = 0, j = 0;
    594 
    595         while (i < ARRAY_SIZE(period) - 1 && period[i] < dev->rep[REP_PERIOD])
    596                 i++;
    597         dev->rep[REP_PERIOD] = period[i];
    598 
    599         while (j < ARRAY_SIZE(delay) - 1 && delay[j] < dev->rep[REP_DELAY])
    600                 j++;
    601         dev->rep[REP_DELAY] = delay[j];
    602 
    603         param = i | (j << 5);
--> 604         return ps2_command(&atkbd->ps2dev, &param, ATKBD_CMD_SETREP);

This fucntion call takes a mutex.

    605 }

The call tree is:

atkbd_reconnect() <- disables preempt
-> atkbd_set_repeat_rate()

In atkbd_reconnect() it's the atkbd_disable(atkbd) which takes a
spinlock.

regards,
dan carpenter

