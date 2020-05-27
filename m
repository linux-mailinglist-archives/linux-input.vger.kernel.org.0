Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0D51E397D
	for <lists+linux-input@lfdr.de>; Wed, 27 May 2020 08:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbgE0GnM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 May 2020 02:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgE0GnM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 May 2020 02:43:12 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740AAC061A0F;
        Tue, 26 May 2020 23:43:11 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x18so8666075pll.6;
        Tue, 26 May 2020 23:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bEyygCOfmyTdpbEkx7nqI3q7Nk/xhjACqUM6Tq0SJKA=;
        b=tyUVKYXfotCB0kHFMT0k0b5d8eTohKomf7ltLmgkUhEzVPTp4Rr1hNg5TwXUV6hgvX
         mWY4LYRdTbTN1AkcRAUJ6nlHKIV6mx2HjTiEKkL02o33kvTWvAksRiDusvvbnlmWl8y6
         yDCE/gHlIE4Jyg/CGorzrlmU03L/tZKPbsmYlbpbHsDZwZv1KnxG7prfnDHZcwFKdqZD
         WIF90NhNhRSPREtN1UCX+rgq+RFTmS2nPsd5UWqb/d6D+xUfyyWrinQS/WNxS0zv45wJ
         FdcSrsnrk8mR9ARlsQwnmEXlqFfbwRsg0oWDrZuK0pfCFzm/0otcY/opUfiEw/LggSWm
         cQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bEyygCOfmyTdpbEkx7nqI3q7Nk/xhjACqUM6Tq0SJKA=;
        b=mwNxXs2m0fIaw8sXV2/3xO5dvC47rt+GpW/Q6MOQ+WowF0FH19ufm8o6ZcnOrLJFDR
         6+ziFQvmWEwnXK3DzIpprSaUL/Qi80SiS+0E4JnPZ49wgdKDmEOM4GKwqv8r0wfT8umt
         4Ry6/03qBwJbSLtUedX5tUz0EYiYT5cDh/aWDzsrdWT8OymcW2ShlbZMDoT4Ot24cZ+r
         i/sRccyhf1AZWkMdQ2Zoxr6vZSj6etURHDyg7y60bvyxOedKK1mFtB0BtjWb1bPqN5di
         XKibf5wEoMzeTR2pbOCElfVCCYS0WKWHDbKbDyUj9gS/FqPp7taadMnYxMNQ+oFWFEpr
         yu4A==
X-Gm-Message-State: AOAM532fjJmu5737QAfLmKqbpQN9bqLBPvIByWojgxRCWtswTFs1YXWM
        TrjYPeznPooxVvO1kp/AFCQ=
X-Google-Smtp-Source: ABdhPJwgVBBlph33BsqFxBB5txtilwEcyi15li63SAmRybNPuUP+ITeAStZXA5Mf3QPRz4NIMOv/ZQ==
X-Received: by 2002:a17:90a:fe83:: with SMTP id co3mr3269325pjb.62.1590561790880;
        Tue, 26 May 2020 23:43:10 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id y9sm1583453pjy.56.2020.05.26.23.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 23:43:10 -0700 (PDT)
Date:   Tue, 26 May 2020 23:43:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
Subject: Re: [PATCH v11 00/56] atmel_mxt_ts misc
Message-ID: <20200527064307.GK89269@dtor-ws>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiada,

On Thu, May 07, 2020 at 10:56:00PM -0700, Jiada Wang wrote:
> This patch-set forward ports Nick Dyer's work in ndyer/linux github
> repository as long as some other features and fixes

Sorry for ignoring the series for quite a while. I guess my biggest
issue with the series is that quite a bit of patches are trying to
handle the fallout from a very unfortunate design decision in the
driver: the fact that it attempts to automatically upload firmware and
config on every boot/probe. This design was done at my urging because I
did not have access to the technical documentation and did not realize
that the controller has non-volatile memory for both firmware and
configuration. We should only attempt to automatically load firmware
where device does not have non-volatile memory and is unable function
otherwise, in all other cases we better leave it to userspace to decide
whether to execute firmware update and when. The kernel should only
provide facilities so that userspace can initiate firmware update. This
design has worked well for Chrome OS for many years (it used Atmel
controllers in several products), and I would like to bring it to the
mainline.

Thanks.

-- 
Dmitry
