Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 075B7228FC2
	for <lists+linux-input@lfdr.de>; Wed, 22 Jul 2020 07:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbgGVFey (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jul 2020 01:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgGVFex (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jul 2020 01:34:53 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F31C061794;
        Tue, 21 Jul 2020 22:34:53 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id o1so403738plk.1;
        Tue, 21 Jul 2020 22:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eHvPGjWaZQ28bLiz1ZmIQtg8R6kb+fan9GkxYboAYfo=;
        b=ZjF9+TVnOp59Feo51MZERSlj/aMtRYnAdf2W84YVC6dlBkNbEho465KcRXsf+oyJq5
         fqt8sc5kW7dFCrrVJZIJeGdObLRFCFjk3q6PwhKv7QLrj35pTnIeg9KB/aR6Kwehrj+V
         2tSVo5hl9rFHv7j1yU5srYWPfqhSFUCc+N24xlTdSP4BojizGO+snDJfS6hhp7bipcRJ
         PfhhvfH6FS5TMsSArWgzAjnWhHatQzxKAa0Zn087e6fDv0rj75z1BPxNd027lkx2Oibv
         477tzC8PwM2/XpTwCtOfBLAkQGMLbvwcL2GsAvhaMIkWsktP7XYqeMbxmHdzriiyJRvi
         cEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eHvPGjWaZQ28bLiz1ZmIQtg8R6kb+fan9GkxYboAYfo=;
        b=adswr2RSM/qhnccf6fOJQHizeeSFNO383RFMccy4ZuarkoWUNpuX2Zq59eiDdbu1k3
         cRtfP3/hdkQsJ3XjhEEQRXa1AkLT2hg0DvIN1QLKTdLCfhk0yW4GsckREgo8Lq4UrRf7
         ACNhqmoj384D+F+nMhWx1NHR667lnPHSpXK7+CcwWF7d9Eq31e4A8dFonKH7ACabqeYD
         NQpEGGiOqzTJPLNvIruOxa2F55dosfQSplAbQh+veZNr9wHeyRm+sCuCimXlZuFptz60
         I2HOxSFVXPmmubogjvI+kxt462epUaBQvWDePAoRrU6Il62xBvKkrKErUilXnvDCxr7k
         s2cQ==
X-Gm-Message-State: AOAM532scLjqtaIgnZfSu0GKqqHzRzYHEUXxVDIcDmdsAly+C5UjNmkK
        3Ik4DP1iVd9PgMvXzaKiJv8v79yQUHk=
X-Google-Smtp-Source: ABdhPJxia3Jv7L1rBV7mCR11MY2r1s1r/L6fKp4S3olC+B7ULrwy8fi5s3+9HbG6iFS1b0oF/SuvCw==
X-Received: by 2002:a17:902:7605:: with SMTP id k5mr24618970pll.331.1595396092514;
        Tue, 21 Jul 2020 22:34:52 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id m16sm22902732pfd.101.2020.07.21.22.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 22:34:52 -0700 (PDT)
Date:   Tue, 21 Jul 2020 22:34:50 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Xiongfeng Wang <wangxiongfeng2@huawei.com>
Cc:     syrjala@sci.fi, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: ati_remote2 - add missing newlines when printing
 module parameters
Message-ID: <20200722053450.GP1665100@dtor-ws>
References: <20200720092148.9320-1-wangxiongfeng2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200720092148.9320-1-wangxiongfeng2@huawei.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 20, 2020 at 05:21:48PM +0800, Xiongfeng Wang wrote:
> When I cat some module parameters by sysfs, it displays as follows. It's
> better to add a newline for easy reading.
> 
> root@syzkaller:~# cat /sys/module/ati_remote2/parameters/mode_mask
> 0x1froot@syzkaller:~# cat /sys/module/ati_remote2/parameters/channel_mask
> 0xffffroot@syzkaller:~#
> 
> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>

Applied, thank you.

-- 
Dmitry
