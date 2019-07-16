Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9946AE5E
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2019 20:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388353AbfGPSTJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jul 2019 14:19:09 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51603 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbfGPSTJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jul 2019 14:19:09 -0400
Received: by mail-wm1-f65.google.com with SMTP id 207so19635391wma.1;
        Tue, 16 Jul 2019 11:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lIqXsG3zHlSz/3p5h6qCoCToOwuWr8K0DIq1OkVbWWI=;
        b=oet6rX2Aa+/ya/nYryVfgg+pPATQvZlrpAldgEvp+mYtomWOthIkW+mWivHQK53jmT
         MUOItAcn1Uc7UzCG4RnJazfQf0uCID+7ZQIR4MkELDHMT8elKflwRjKaNn+Z3n5bLN/j
         kvwwJvnSAaIwiOgG2X+v8frP9Cw4hFLO8TTXp/mPQxiAUB5ZNVzD5oilxUDjQqezsFtY
         IS2NRIF5nW3x7yKQDYiF8tUfo5ILSRLAuMPXSAubethr7b23jG3cvtbwwXzmZ4lWf950
         XIFwgQM8oX/AkvX+5TU7MxqGx5zz1kWDsu7FtRdeVXaT6S62nm1mUO/mr4tQrvHrAc9U
         IyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lIqXsG3zHlSz/3p5h6qCoCToOwuWr8K0DIq1OkVbWWI=;
        b=pKerAmxpxSFX5/XwHcg+PBmrr42kYFiJAP5Od0R2HSfYdnxjjiiNTfjx5tfNzdp4wa
         FjfpwniwbKjSrvFOu549PDtkkcf9KAWGCG4PxLEpXHXjnwM58pBgHwk1HKAWgVIpj2zD
         bn9/aU1vJzn8esx865d+BLpNqYr9bB53fvryQL3w4X9oC1mS9dGtQ3YsTyyR9cmCA+VA
         0L/2a71BvVfocQLmznYV+Tcqk3EkfDt/L2TuCDkEPPwofrKXHQUo2LFsxT1CHS+TbuxB
         7Rf08SNxGk4Ro+S8N8mmXjuoO6SVLxtr/utsPVXZQBDFTNCK8gFUaGBEFyytqoBdFCpG
         2JAw==
X-Gm-Message-State: APjAAAWE/g9KD1+RGkC9Gf7O2+TFjLWv8Qg2nu1GzVSWx56C51XMMavz
        XxNInnW++FUZg43FAsdBWA8=
X-Google-Smtp-Source: APXvYqxmAXgR0/JYyKnKQYHuf7dNpJEuNY0ngKjqjnppH4MCHWif39inWlZ8tXDUomDtRFbndZ+f7g==
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr30432041wma.107.1563301146302;
        Tue, 16 Jul 2019 11:19:06 -0700 (PDT)
Received: from [192.168.2.202] (pD9EA39E9.dip0.t-ipconnect.de. [217.234.57.233])
        by smtp.gmail.com with ESMTPSA id g131sm14596386wmf.37.2019.07.16.11.19.04
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 11:19:05 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] input: soc_button_array for newer surface devices
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20190702003740.75970-1-luzmaximilian@gmail.com>
 <20190702003740.75970-3-luzmaximilian@gmail.com>
 <20190716072135.GA806@penguin>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <92e13b01-7353-1430-fb38-b5098d509da2@gmail.com>
Date:   Tue, 16 Jul 2019 20:19:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190716072135.GA806@penguin>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Hi,

On 7/16/19 9:21 AM, Dmitry Torokhov wrote:
> When you are saying that Pro 4 and later models use different
> notifications, does this mean that Pro 4 does not define any GPIOs?

Unfortunately, at least the Surface Book (first generation, buttons are
handled the same way as on the Pro 4) has GPIOs defined in MSHW0040, but
they are for different use. Specifically: They can detect if the
clipboard (screen part of the device, the device basically has two parts
that can be separated: clipboard and base) is being removed. Relying on
the GPIOs was my first idea too, but that has been reported to shut down
the Book 1 when the clipboard is detached.

As far as I know, the OEM platform revision check is the easiest way to
differentiate between those devices.

> I do not believe -EAGAIN has any special meaning in the driver core;

I think I got the -EAGAIN from an outdated LWN article when I first
started working on this, thanks for confirming.

> also when the GPIO controller is not ready gpiod_get() will return
> -EPROBE_DEFER, which is the prober way if signalling that some resource
> is not yet available and probe should be retries at a later time.
>
> Moreover, I do not believe that gpiod_count() needs GPIO controller to
> be ready, the count is taken from board firmware or static board file
> definition, so if gpiod_count() returns 0 it should be clear indication
> that the driver should not be used with the device.

Thank you for this insight, I will update the patch accordingly.

Maximilian
