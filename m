Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E26BC163A7
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2019 14:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfEGMYU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 May 2019 08:24:20 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33916 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbfEGMYT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 May 2019 08:24:19 -0400
Received: by mail-wr1-f68.google.com with SMTP id f7so11744538wrq.1
        for <linux-input@vger.kernel.org>; Tue, 07 May 2019 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=c8UCZCqORpSK+CE2DbTRM/OMRX9RiKxjhdEM+EyKPvU=;
        b=W4Emdehqjy99UlzAo85JrlIBjtXEJLUKNBvLXnD3R+3t6Ms2yQAaNiOVYhjLM6t+H4
         xBjZNwZe7HdTDINfeLAEFp3WZ02ENgbKNuhA0u75ZjfNHAVoKr4lT6FknyB72sA8Ltc3
         YMC+VjPkzQ03UO4jbHoTPmg64LnNxNOfoZAWtCMiAOSeRk7ZZ8SOkhA01Qd8Rge2axtU
         rpze1d08YWLSx80h7+Ac8qR29X+8vMWpLKgDTySdNN3saYCOLThKeGWRpG/VEQw1l2+0
         x+mhWg2LDCMfEhSKkDLWX6Y5jbh/+ausa9i0nnG4EdVqYXQFl4iNONj13IDCdszihWrK
         2e7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=c8UCZCqORpSK+CE2DbTRM/OMRX9RiKxjhdEM+EyKPvU=;
        b=ilMgT0B97fwCcQPHBqSMIqcU1LLibV/SUB2KEJWOW1OY6/eFAMsu7jZ4LMaP1fFCR6
         p/ZysoizTc8RxZaEuzDsjUdlQa7vARhjKNxWD+OLYgUxC4pzF4uACjAD12Ce7DtZW6y3
         9ijLgKf/r4WWT5oA4crvrkuutYok8rx+UGLcfrgVS46D0i9GSGc2qvQnHVUUBCHU4Po0
         yHw15M39WKcOh1R13MHjDpfP4OMjp50hlvobeWm1v2AFsq2Hi5vr9APWQATvF/GJp+dR
         UyyJvy1yxacABKnLXjHkZT/OrUUvtLc21q+hjLut7LzyXk3AHOqo00VjEMmwu8p5Nqkm
         +iMg==
X-Gm-Message-State: APjAAAXjNO0aQErjkvSpufhVhFw5X9Hi7oCRdbZ+TyPYT0QgOPucihTa
        qpbdvVfxin7Ye0K7W6CNy33JMQ==
X-Google-Smtp-Source: APXvYqyHkuG1GnMGrNjBvW3yFe3CfX4x575oW2Y44TAunp1pLjdzpDRTPzvmDc2o35sWGMK6ezE0Zw==
X-Received: by 2002:a5d:4d46:: with SMTP id a6mr3541380wru.142.1557231858133;
        Tue, 07 May 2019 05:24:18 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id b12sm24376971wrf.21.2019.05.07.05.24.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2019 05:24:17 -0700 (PDT)
Date:   Tue, 7 May 2019 13:24:15 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Ronald =?iso-8859-1?Q?Tschal=E4r?= <ronald@innovation.ch>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-input@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mfd: apple-ibridge: Add Apple iBridge MFD driver.
Message-ID: <20190507122415.GC29524@dell>
References: <20190422031251.11968-1-ronald@innovation.ch>
 <20190422031251.11968-2-ronald@innovation.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190422031251.11968-2-ronald@innovation.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 21 Apr 2019, Ronald Tschalär wrote:

> The iBridge device provides access to several devices, including:
> - the Touch Bar
> - the iSight webcam
> - the light sensor
> - the fingerprint sensor
> 
> This driver provides the core support for managing the iBridge device
> and the access to the underlying devices. In particular, since the
> functionality for the touch bar and light sensor is exposed via USB HID
> interfaces, and the same HID device is used for multiple functions, this
> driver provides a multiplexing layer that allows multiple HID drivers to
> be registered for a given HID device. This allows the touch bar and ALS
> driver to be separated out into their own modules.
> 
> Signed-off-by: Ronald Tschalär <ronald@innovation.ch>
> ---
>  drivers/mfd/Kconfig               |  15 +
>  drivers/mfd/Makefile              |   1 +
>  drivers/mfd/apple-ibridge.c       | 883 ++++++++++++++++++++++++++++++

I haven't taken a thorough look through, but I can tell you that the
vast majority of what you're trying to do here does not belong in
MFD.  MFD drivers are used to register child devices.  Almost all
functionality or 'real work' should be contained in the drivers the
MFD registers, not in the MFD parent itself.  You will need to move
all 'real work' out into the subordinate device drivers for
acceptance.

>  include/linux/mfd/apple-ibridge.h |  39 ++
>  4 files changed, 938 insertions(+)
>  create mode 100644 drivers/mfd/apple-ibridge.c
>  create mode 100644 include/linux/mfd/apple-ibridge.h

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
