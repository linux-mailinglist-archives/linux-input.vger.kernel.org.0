Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16FCF88C81
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 19:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbfHJRov (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Aug 2019 13:44:51 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36950 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfHJRov (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Aug 2019 13:44:51 -0400
Received: by mail-pg1-f194.google.com with SMTP id d1so14588086pgp.4
        for <linux-input@vger.kernel.org>; Sat, 10 Aug 2019 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gx03W705Yw5Ng6rv/3doM27aVo+51vXKRYxQUBf3xJQ=;
        b=skdvEqothAZNZfccOgklJfV9U9e2h5abK/4cCAUP7UVjJpAB09VB2RgSP8qRBGy1Pn
         Rqaif/WkYIKVEGpw24VdDr+6j99OOJx9NnHxBhhkUDRWIKOxFBNEg9kylpBQgrdJGHAm
         euDkkKfSc/+QzzTOjnRNwBEMq/rfvP83YgP2CZQaeIcCh6092KzNZM+xFtqxodD2RBIy
         22QS7N5YQpz9VNosUSiQlLhKaf7Tff2cDQlj7UNrg579iymZYL6fJ9Hydo864jySyWyr
         IDN60ZtDpIQdwKK1hXQAoVJJhTevG4JJjoFmJNi0rrv/17NldC6aDX3CxXzRHbKFt7gL
         qDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gx03W705Yw5Ng6rv/3doM27aVo+51vXKRYxQUBf3xJQ=;
        b=latUQBJRY6i2fiZNzfbRS+F2bbWM7OV8rb3v56Tx5zze+b1tHIjcbPdiBadae/2nDK
         MnxSC3RgxZhr4eleVXa79H1PsB27ZFTEDgHfw3+9tD5JwFfKAS4DzTMDvdTwNoh3bqg0
         L94P/mEEweMTAOmqmokRRPMmjnrnf4Jj4725xfMF39Qt8NBubtBmVBiU7i8zrBI1kVYM
         ZfRkGOezOBo+jfJv3ODsIkeL2xawL1mzyeggIJxxzIAz8DnUIKDvkPN+rH8FVfAr4XOo
         kFo+AssX96maNUZxj4S4ESEXKsbVptJTZJ4RMJ33l+0MjQN4SwUWg9vlU3VcMzhab11h
         739Q==
X-Gm-Message-State: APjAAAXo7wL2aucEZm7O+iOeTOq6W5q5vKvAzU4XMND7Y83fBFmXnp2Z
        68DHK/NsKoZIZDoO2V8Rbsk=
X-Google-Smtp-Source: APXvYqy1H22SkuP53luwaBzlAtW9T4th6q/GwIiCHrVKW5k6U4r/kxT9A/ug+XGvQwdaKGJQ47wuMw==
X-Received: by 2002:aa7:8189:: with SMTP id g9mr28319717pfi.143.1565459089929;
        Sat, 10 Aug 2019 10:44:49 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id d189sm8285069pfd.165.2019.08.10.10.44.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 10 Aug 2019 10:44:49 -0700 (PDT)
Date:   Sat, 10 Aug 2019 10:44:47 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Olivier Sobrie <olivier@sobrie.be>,
        Philipp Puschmann <pp@emlix.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
Message-ID: <20190810174447.GR178933@dtor-ws>
References: <20190302141704.32547-1-marex@denx.de>
 <20190302141704.32547-2-marex@denx.de>
 <20190810164137.GQ178933@dtor-ws>
 <27428362-1bfc-de9a-da19-c47a9d483e9e@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27428362-1bfc-de9a-da19-c47a9d483e9e@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Aug 10, 2019 at 06:50:08PM +0200, Marek Vasut wrote:
> On 8/10/19 6:41 PM, Dmitry Torokhov wrote:
> > Hi Marek,
> 
> Hi,
> 
> > On Sat, Mar 02, 2019 at 03:17:04PM +0100, Marek Vasut wrote:
> >> Add support for ILI2117 touch controller. This controller is similar
> >> to the ILI210x and ILI251x, except for the following differences:
> >> - Reading out of touch data must happen at most 300 mS after the
> >>   interrupt line was asserted. No command must be sent, the data
> >>   are returned upon pure I2C read of 43 bytes long.
> >> - Supports 10 simultaneous touch inputs.
> >> - Touch data format is slightly different.
> > 
> > So with this and also I see there is another ili2117a submission, I do
> > believe that we need to switch to using function pointers instead of
> > if/else if/else style cheking of the model.
> 
> How about we add tested functionality in first and only then do bigger
> untested changes ? I think that would work better for everyone.

Sorry, I would really prefer to do what is right and build additional
functionality on top of the good foundation. I asked to switch to the
function pointers before, but you did not want to citing performance
(even though we are using function pointers everywhere in the kernel),
now I gave a draft implementation, I hope you can use it.

Thanks.

-- 
Dmitry
