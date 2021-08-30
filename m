Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC52E3FBF88
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 01:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239045AbhH3XrG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 19:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238942AbhH3XrG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 19:47:06 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199B2C061575
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 16:46:12 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso633001pjh.5
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 16:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pLPt1xpCCMncAU/65p3b9rJbfk0M8v9f4bDR+VLbbd0=;
        b=grvMP+tXJ2wjVYqnwT9dm+r9Qn0ky4B29qEOj6Af25OgiPAKCueMAEFh3F1q6qJgpS
         xDg56GdOMiv9rUuxAGKP/dO86KBDP8/3ZBYTgFlzcx0ygqPw552EcoUQlAsUg9YsLoMx
         nS+NVNNWbf9dOsMg8XfrUqEswGGK0Svw6s5Xw3LvOcz+kqpbZ6ElIIyjyKa6HY9yDiyX
         xH7ttkte6mbSKRKIGoXYYztzOq7jwFMzsPTy8afQ4PrpEaTHjb5485kOV7eASTIsOXt6
         jAMaAf38D6NOoU7LSihaxnZlsBl3IuOmbmrixEQJsCRm29muK6EYHjutWPEZ7/lbEGG0
         HrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pLPt1xpCCMncAU/65p3b9rJbfk0M8v9f4bDR+VLbbd0=;
        b=ZqVBPIZ+yR0NIlY/w7EiBKme3tKk/LmUAzSsH9CC8Agv/VZQLJPN5VOJOkSsnjhGuq
         CqN2pDAiIKvCPvSuaOiyCoZlpLySA3be3rK9C6YKVT3Om4X0jnAn2ZJbTZtJFO1b8Hve
         IGEXpDxHMlD/iaZm1ffl+vP4jgu3mXIHcknoLqqrF36hIwoo7MsIAsvUqx2vkVJYkyQj
         NkBlqIOI6QFSMlvu+cZVVmkmOQHxEBZTxdcIWTJGNZvaU59zDfv9UmgwvJdggErOcx/W
         twd1AmCIqrkLxnCnwP23Txzd2/5swEXwiR5yNVBHa25NY6iAF6+jxVu/lPPqfwzfe9t9
         ZNLg==
X-Gm-Message-State: AOAM530F3iw93X7bHJtXePvERU4fc0zf4huPP+eW9nXJ0Vg+/y4ui4td
        JMe5heRowbQaJpA+bxtfCQ2DieKQl7o=
X-Google-Smtp-Source: ABdhPJzgTzNNv9gmUzO6kwTCH9i0E9HmW3y9V4ms1pkTcImIKJzMH8Si19+1pAijSGy2taxzYNH3uA==
X-Received: by 2002:a17:90a:d98f:: with SMTP id d15mr1743621pjv.81.1630367171616;
        Mon, 30 Aug 2021 16:46:11 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:771a:afc8:2e96:23dd])
        by smtp.gmail.com with ESMTPSA id b5sm532088pjq.2.2021.08.30.16.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 16:46:10 -0700 (PDT)
Date:   Mon, 30 Aug 2021 16:46:08 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, ch@denx.de,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH v2 1/3] Input: ili210x - use resolution from ili251x
 firmware
Message-ID: <YS1twDwAG+W3YurB@google.com>
References: <20210827211258.318618-1-marex@denx.de>
 <YS1FsJROzDkm/0Ky@google.com>
 <bfc05564-38dd-d950-ed71-0599c48d57f4@denx.de>
 <YS1oEX75iIjQLn9r@google.com>
 <3c4be28d-e749-d63a-37c5-60ff686dc6dc@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c4be28d-e749-d63a-37c5-60ff686dc6dc@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 31, 2021 at 01:31:06AM +0200, Marek Vasut wrote:
> On 8/31/21 1:21 AM, Dmitry Torokhov wrote:
> > On Tue, Aug 31, 2021 at 12:49:49AM +0200, Marek Vasut wrote:
> > > On 8/30/21 10:55 PM, Dmitry Torokhov wrote:
> > > 
> > > [...]
> > > 
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	priv->input->absinfo[ABS_X].maximum = resx - 1;
> > > > > +	priv->input->absinfo[ABS_Y].maximum = resy - 1;
> > > > > +	priv->input->absinfo[ABS_MT_POSITION_X].maximum = resx - 1;
> > > > > +	priv->input->absinfo[ABS_MT_POSITION_Y].maximum = resy - 1;
> > > > 
> > > > There is
> > > > 
> > > > 	input_set_abs_max(priv->input, ABS_X, resx - 1);
> > > 
> > > git grep finds nothing in linux-next / your tree on k.org / patchwork. Where
> > > is that ?
> > 
> > Look for INPUT_GENERATE_ABS_ACCESSORS in include/linux/input.h
> 
> Oh, input_abs_set_max, thanks.

Ah, sorry, mistyped the name first time around.

-- 
Dmitry
