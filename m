Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB2A11727F
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 18:09:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfLIRJr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 12:09:47 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43665 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbfLIRJr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Dec 2019 12:09:47 -0500
Received: by mail-pg1-f196.google.com with SMTP id b1so7412200pgq.10;
        Mon, 09 Dec 2019 09:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pxR9OL2koDKg/3kIifbaT16MBvgcVlZuSEvOdTpT87I=;
        b=q/Ecd0Dy0oR0p6xTe78pvoQNUKDaA3Mzt6kfOEo6X2D/aVl1R77JSOGWl7e6aueqBk
         lOeW2z2YLEiN+MrxuqgTD/RUzv04Q9Jd/asfEIzAgRw9gannmW8QfrFi2LjqZuI1hsIO
         E/4KsNPeMA7glNb3QI8OKbpcL4uKLqArWWBIQMoWbCLwS6btrFI14uFmynlvkDUpujYP
         t9awIuI/rAIeJioLgqSn0otRIB5Q1hLLglbDsN7A98tbWRMGg4LCnrcT/dzfEaDy1uPa
         lXbcx6p8YRcFIMMAW8PrYKUMvell3W/wNspuPeESHjTu5SD32RNC38jkPuHW3MUH9RfI
         pxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pxR9OL2koDKg/3kIifbaT16MBvgcVlZuSEvOdTpT87I=;
        b=mgSt3aakcw/zuYLf870YhTnaFVOYqEin3uEdS53eeACoHX67/fdkcE+gn1GmIKDZ+Q
         p87m7/NkMS/xpa9p9xfMoXON2aFD7sFMyjekNaMFHioVU+2Gcbne+ZFI4Bat3O3H0nUR
         F3q0b05U5s+mfwIWpmc1my+DysqRJkQskR1xQwU84jHgv8Uf+GS3Ve9SBQMqlVn6fCpA
         enRtXwPP4U1tavYIN0V2PoS8LPoCT/oJRaf5caWwzhkEZ9k2RRF/Og6Htc3hKz7H66NJ
         y9ZpDbaZ0I/6D2iwRpNyFF90g8k28UH8TW3/Q1xX7mY1pVsVeOHUkrY7JnZ4rSfz9mdn
         9yFA==
X-Gm-Message-State: APjAAAVhbMA4HQtgkyFgYnAFeSYjNPON+dLWsjDedz67jRwK6wnmYToP
        WejVFMCGbvmdsUwfPGkvinA=
X-Google-Smtp-Source: APXvYqzCyyaNIE3KzSGX/QfEEikgSI1Hzm9H5izdtf3i+Rkun0MBxR53//cONkKOJp+2gANn3FaXaw==
X-Received: by 2002:a62:b411:: with SMTP id h17mr29363565pfn.221.1575911386124;
        Mon, 09 Dec 2019 09:09:46 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id d14sm28651pfq.117.2019.12.09.09.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 09:09:45 -0800 (PST)
Date:   Mon, 9 Dec 2019 09:09:43 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-input@vger.kernel.org
Subject: Re: [git pull] Input updates for v5.5-rc0
Message-ID: <20191209170943.GU50317@dtor-ws>
References: <20191207202733.GA153817@dtor-ws>
 <CAHk-=wiNz9CtHCobs+WNKeCcgd23adbRtPzoBk7WwEw_Z=i5wA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiNz9CtHCobs+WNKeCcgd23adbRtPzoBk7WwEw_Z=i5wA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Dec 07, 2019 at 06:35:52PM -0800, Linus Torvalds wrote:
> On Sat, Dec 7, 2019 at 12:27 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > - one can now poll uinput device for writing (which is always allowed)
> 
> Well, except the code says "if there is data to be read, then it's
> _only_ readable, and you can't write to it".
> 
> Is that what you wanted/meant?

Hm, not exactly. I will fix it up in a followup change.

Thanks.

-- 
Dmitry
