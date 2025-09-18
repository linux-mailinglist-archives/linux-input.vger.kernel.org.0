Return-Path: <linux-input+bounces-14841-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F91B83491
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 09:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BADE546584B
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 07:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA662494F8;
	Thu, 18 Sep 2025 07:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kPU9UzmU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401BA23315A
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 07:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758179926; cv=none; b=WiO06eUeeWIT+WtAZQfcGuAm/busxLdHPRAH35Jenq87l67FJsAggG1Jt/C2Ttof5ZAgecPy6kbPjrl7o/FxCFb8QGyZs40HHw7IUXQ0Ph5Xg6E2uesD16oA9oYLtfolOf5DONanrFDmUWuqUT/NNkSWvFzSwIHJDEafbhSNJvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758179926; c=relaxed/simple;
	bh=Zcx+kUadXumXLmullAjhNmxd+rzQxRDV1fBFL8R63h8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JDKD1UBeloHuATzr4oW4F5mkND56AXi36NtriPo3HL9puNQwn+rKxIni0jvizDqyQSU+JlvCJvIoY2fVyJTkCyGBtaOQMt2TXcm0r7lD1++JP/EdkJR+2Z84zGUxzIClL9nfC2Ie268y1fFy8PY0BpJsgjOl7lHcDzPlUuAHNUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kPU9UzmU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b9a856dc2so3566795e9.0
        for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 00:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758179922; x=1758784722; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CcYCsY+/Yrn2LyKSWQcivthGTCfhewHR5t04EjlzqaU=;
        b=kPU9UzmU8Pkugn8A++7okMG5QYap6avkWzcMleSCcB/w9DR+9itdJ8jfwccbulp/sk
         J7sS0ngBnDXuLHZTSFGBsSNW7D1aI5Ax4hSkyxRNQ3G6oXhtFsoT2U1IhqU69xwXziSb
         cYtC8/bmRPANfe/EHVmAH0i+qWpYTWamxbOLnH7D3UEI1qj1vbqGWa0mpOB77c9lJwFz
         LreEOGk7HqAjsd+zPv5NLeHV1wdSd7cFWwKjbfcLi9tapF3HTYAvXf9jqtoiaxkzf9N3
         V3pm/BR+zClGUtdXfvD1aZHmpNhMMkQohFZCmiVc+HX/o8jIo9U6ETDd68N4BQPQhYO1
         H8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758179922; x=1758784722;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CcYCsY+/Yrn2LyKSWQcivthGTCfhewHR5t04EjlzqaU=;
        b=tlrq48uXxsnTSAtGh2VLsbO9EKIDjue8W7RsRdbI0ZqK/ibBU3nz4ymIKbTuPeAaZV
         h/9Migq9S4gr3N/22Ko/XqG2t+CWet/LF9nt0sfgHnVKSmCXunwsgELEZWaitCY7YEJw
         hFvBG8EYD6tYR3VhHmu2yzm6+yJF2b8cLAEXCPIQv8iT2Lt3f4CrLXiUjVg4ZWpnSUkR
         ZQFBFZ59xP3Xk6SMaNs8MQP1SXB0cJdxtFtiuja0qinlAsL0AbX+YXrr6kBlmbVzmB7K
         wEE+x8UrwHhpqtymhkurj8YXX6JLogBBlTItwxWYVIAn2ZCYBqE4Kbipe43JF2GY6bcb
         CccQ==
X-Gm-Message-State: AOJu0Yyt65nS1MC7KSgCm0KeeFZOU15a1KQsmsEWbqUHPBGxSQj7xInL
	a+BVbk66l/ejz7nkdNdGWNC0375ECaKW7TXRxe8uxuIccoz1tws7T1VgEIqdAWmVnGI=
X-Gm-Gg: ASbGnctwHzmBnPsh54Op4TfJTeSNQxZeelHfG5bx5InxlG8iWnjbY7Hl4OICbmQSv1i
	vaCI3tGjOyWRmxdote7Y2zGvoVSaxeBBtyixNbwBQXTnuHRbasZ2ixfY2Cgg7TIDYdANOR92lMn
	Rz15ZQQZ8z9/wlWunw+5V0pcdd312dtLDJCLFRBEdeHtLP7opeHXoOyqaLKZLpgU6tSF6tkvdrQ
	9/GQOZGO+eM/0th7YRfPR/36+OXlG9gH3zmUpy1BNiDAXpFD+OMr0GgjqiCHnSLcv3yDQgLjkMN
	gXics1xDhcYNg7U+II2UmTcXT0ujFycHnSG272bd0Omd1t5OTE4v8qtpaeh4nC6+pDGRBN1nDhl
	B0eO4sPILPqhmlx22XS0FeS7uBeKCAaUXQ8FDseeFNYBTPJ63lQpW6k/q
X-Google-Smtp-Source: AGHT+IH9wxy/9fe0wDhdlVnmCaP+V8g5OFiJwwtiAW1V4VeAPxIM4ip0z/7MbOD2t9rVg8dYcNpgEg==
X-Received: by 2002:a05:600c:3b16:b0:45c:d817:2a6a with SMTP id 5b1f17b1804b1-46202bf7aabmr45582565e9.9.1758179922546;
        Thu, 18 Sep 2025 00:18:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee073f5387sm2324890f8f.1.2025.09.18.00.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 00:18:42 -0700 (PDT)
Date: Thu, 18 Sep 2025 10:18:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Angela Czubak <aczubak@google.com>
Cc: linux-input@vger.kernel.org
Subject: [bug report] HID: haptic: initialize haptic device
Message-ID: <aMuyTgPtUnfdk091@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Angela Czubak,

Commit 344ff3584957 ("HID: haptic: initialize haptic device") from
Aug 18, 2025 (linux-next), leads to the following Smatch static
checker warning:

	drivers/hid/hid-haptic.c:528 hid_haptic_init()
	warn: missing error code here? '_dev_err()' failed. 'ret' = '0'

drivers/hid/hid-haptic.c
    518         }
    519 
    520         ff = dev->ff;
    521         ff->private = haptic;
    522         ff->upload = hid_haptic_upload_effect;
    523         ff->playback = hid_haptic_playback;
    524         ff->erase = hid_haptic_erase;
    525         ff->destroy = hid_haptic_destroy;
    526         if (!try_module_get(THIS_MODULE)) {
    527                 dev_err(&hdev->dev, "Failed to increase module count.\n");
--> 528                 goto input_free;

Missing error code.  I think we're trying to pump the module count so
this module is unloadable.  That's a discouraged thing so the
__module_get() function has a double underscore.  But here we're kind
of dressing it up so it looks like we're doing a legit module count
bump of a different module that we rely on (instead of THIS_MODULE).  We
should just use __module_get() because it's more honest and remove the
check.

    529         }
    530         if (!get_device(&hdev->dev)) {
    531                 dev_err(&hdev->dev, "Failed to get hdev device.\n");
    532                 module_put(THIS_MODULE);
    533                 goto input_free;

Missing error code, but get_device() can't really fail here.  Just remove
the check.

    534         }
    535         return 0;
    536 
    537 input_free:
    538         input_ff_destroy(dev);
    539         /* Do not let double free happen, input_ff_destroy will call
    540          * hid_haptic_destroy.
    541          */
    542         *haptic_ptr = NULL;
    543         /* Restore dev flush and event */
    544         dev->flush = flush;
    545         dev->event = event;
    546         return ret;
    547 stop_buffer_free:
    548         kfree(haptic->stop_effect.report_buf);
    549         haptic->stop_effect.report_buf = NULL;
    550 buffer_free:
    551         while (--r >= 0)
    552                 kfree(haptic->effect[r].report_buf);
    553         kfree(haptic->effect);
    554         haptic->effect = NULL;
    555 output_queue:
    556         destroy_workqueue(haptic->wq);
    557         haptic->wq = NULL;
    558 duration_map:
    559         kfree(haptic->duration_map);
    560         haptic->duration_map = NULL;
    561 usage_map:
    562         kfree(haptic->hid_usage_map);
    563         haptic->hid_usage_map = NULL;
    564 exit:
    565         return ret;
    566 }

regards,
dan carpenter

