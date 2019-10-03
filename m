Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9526CCAEAA
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2019 20:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729988AbfJCS5l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Oct 2019 14:57:41 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41534 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729334AbfJCS5l (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Oct 2019 14:57:41 -0400
Received: by mail-pf1-f193.google.com with SMTP id q7so2314787pfh.8;
        Thu, 03 Oct 2019 11:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=77ylIXsEbYhUXexead1rm79X/JZoqHaSnH4twYhYCoQ=;
        b=BpE9oIq1CkyRCJfS8Nn2AnbjENHyzwH5NgPOeVNQUQBPh7UjnSVpGKz0ge3saGm/iF
         u9Fcz0pmEzvbRqy3zYSji48bwSSbZ06d/3D6t1WFFaKVZPnunteU5BMuhPqymZOfX0QW
         6v0XzWb0j2/xVW4cbs51ECFH6q7gKyAVdAusUUoJ1yAv32vdJBCaKymC5+gQHjDbJd3k
         uWJ9HYp5euk8lArRNufDVBNvGX7sOaUbA0HHWuSEfo2Vav2Si8JQKwhffYLV+I8Mbnij
         zCleNJAe1IcxrIZfgnHk4/NRq0KShU4326UeI0hIJcFy1rCQzaZ86yMDgYwbnVTo2BXF
         ALFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=77ylIXsEbYhUXexead1rm79X/JZoqHaSnH4twYhYCoQ=;
        b=uW8+aTW4kUm2Y7BoaSxyeG13VYEZ5RhLAcZsLrXj7ZYjLS8ug04Jvh37/irrX4b2bQ
         hgkPjsS0EqSclUnfrrNlShdZaFrtbI2jmAGkKfa7saBYaBPLgXsXYxXPAKALeJA4sTrs
         pUWsIJ0q5eOkABK1E9wWK6hgpRYE+DyDQKPJmGf53a8QXGJi0CIbzrYZXcQ2aiqBMmBu
         2lc84sFEUh8HIq2tIRNVO3MZlfkYOo3TTPFjU4OeY22Uc1u7tV1xnzM9E6MJVKI/w3MA
         +OxwXNun7pDVgojCPMpVzGcpF9lX0I2NM2EGknmSv4+2oT1UVWeEWFo/63tAS4y7Bahx
         bs4w==
X-Gm-Message-State: APjAAAV02hg8wGvN9vwE45jjJbPiFVpw5JiESrVSKYSOrNy+ld7N9ORi
        bmrDgO7K7EHxmB0Kevwnvl0=
X-Google-Smtp-Source: APXvYqwoNe2DbK34Yvqq3TzuS+OFDaVRV5Awc4BhXJrMiJoZqeLJNE7zu/wy+ZIvsGb0ufzTgTz3zA==
X-Received: by 2002:a63:6b49:: with SMTP id g70mr10705775pgc.92.1570129060362;
        Thu, 03 Oct 2019 11:57:40 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id j22sm5381780pgg.16.2019.10.03.11.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 11:57:39 -0700 (PDT)
Date:   Thu, 3 Oct 2019 11:57:37 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Input: add input_get_poll_interval()
Message-ID: <20191003185737.GC22365@dtor-ws>
References: <20191002215812.GA135681@dtor-ws>
 <CAO-hwJ+v1jJJ=APP__84SPrFdR+Te8nAxR6DirD8a9US_Bm4wQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJ+v1jJJ=APP__84SPrFdR+Te8nAxR6DirD8a9US_Bm4wQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On Thu, Oct 03, 2019 at 02:34:59PM -0400, Benjamin Tissoires wrote:
> Hi Dmitry,
> 
> On Wed, Oct 2, 2019 at 5:58 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Some drivers need to be able to know the current polling interval for
> > devices working in polling mode, let's allow them fetching it.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Not sure if you really need my input on this one, but, sure, looks good to me:
> Acked-By: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Thanks!

I like for someone to have taken look at the stuff I write before I
commit it to the tree, and you are one of the most active developers in
linux-input, so I tend to copy you on random bits and pieces and I
really appreciate that you take time to check them out.

-- 
Dmitry
