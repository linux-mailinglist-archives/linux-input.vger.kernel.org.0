Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20F7C3D451
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2019 19:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389490AbfFKRft (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jun 2019 13:35:49 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34245 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387856AbfFKRft (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jun 2019 13:35:49 -0400
Received: by mail-pg1-f195.google.com with SMTP id p10so1500051pgn.1;
        Tue, 11 Jun 2019 10:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nYhGZL91pZw+wH1RPe0GlZnF8M2foOXuUczt27U5dP8=;
        b=DqnRKRIOmgAUU9DYq9awpNFvAR+1a+jI5G4+R/gv7Ems6hGEu5Fuz0taCYNc0KgDN1
         IXAEFjXvy1gbxjH21Yi+uQVZ6AVlmKUZI57YFHEy9RtCwcpTL6E3B1/pebgrazymsfWB
         +/xVa6jWZiJfQgoW9f8uj4PP+4Y5Fm072JpjOIck5CP44w1I3sNdfnBzQYXjtYy39rN0
         69Vg7y0In1JEkSnjteyfDDn11cqLYqKqCSVmx7qUs1+QkdB4ROiA3FHJt5zNjRtxBjw6
         VTg5mb85nTtCWyjsc1t4DoQ10SJd8B7V7DLb7UKnI5FPuKsL4ODy5qektksH3paxnTLr
         gBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nYhGZL91pZw+wH1RPe0GlZnF8M2foOXuUczt27U5dP8=;
        b=bIYAydmzh7u1dD4wo+y3qKU8Pv+0BCw2jaYvO4+QkQeRLb4inDqJVqv1HbSkmDOQdQ
         cpenQD0ShnHxcKPM61fSDrHwegLDLD8qzajcjEtKE5tBRWjszegVAnvfQnQ/s9XTRWe2
         Kl2li6V17B284E/BrgvDx/hx2b4tPRgzD0oc4baX/014cCLPal+sIWWeoypWSVZegOk3
         CUWNM6fh3bY0mFz76BVXGlxJBZRZHD5Bp6Ox8OU4N72aiGzi6KM7UR6bU7pIMKf/nPSZ
         3XuE9BAaWNChwJCO1gj06oyGsGlIghiDm5DNMkwxWdSISczaRddQzZX7Bymalm5qQO/5
         cLdw==
X-Gm-Message-State: APjAAAXIWJoL6XgF2Y/TSTit3gCu7NnvRnE9VdfHuGvjbhBIzCLug1F8
        gB0E1tzDQX22bRMM/OXrzzxmbQXP
X-Google-Smtp-Source: APXvYqwhewRkeVFc1BlluC31iaO31CKuTbUaMZOSKnyOru3oMgODyfr2eURNHDsOK1I2higlqvkQZw==
X-Received: by 2002:a63:5c15:: with SMTP id q21mr7148352pgb.248.1560274547926;
        Tue, 11 Jun 2019 10:35:47 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id x129sm17063765pfb.29.2019.06.11.10.35.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 10:35:47 -0700 (PDT)
Date:   Tue, 11 Jun 2019 10:35:45 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Aaron Ma <aaron.ma@canonical.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Cheiny@synaptics.com, aduggan@synaptics.com,
        benjamin.tissoires@redhat.com
Subject: Re: [PATCH 1/2] Input: synaptics-rmi4 - clear irqs before set irqs
Message-ID: <20190611173545.GE143729@dtor-ws>
References: <20190220164200.31044-1-aaron.ma@canonical.com>
 <20190609165551.GB90002@dtor-ws>
 <7da443d0-f433-c5a5-5194-707362eb2ee5@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7da443d0-f433-c5a5-5194-707362eb2ee5@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 11, 2019 at 12:55:58AM +0800, Aaron Ma wrote:
> 
> On 6/10/19 12:55 AM, Dmitry Torokhov wrote:
> > Hi Aaron,
> > 
> > On Wed, Feb 20, 2019 at 05:41:59PM +0100, Aaron Ma wrote:
> >> rmi4 got spam data after S3 resume on some ThinkPads.
> >> Then TrackPoint lost when be detected by psmouse.
> >> Clear irqs status before set irqs will make TrackPoint back.
> > Could you please give me an idea as to what this spam data is?
> > 
> 
> It should be some data 0 during suspend/resume.
> Actually I don't know how these data 0 is produced.
> Not all synaptics touchpads have this issue.
> 
> > In F03 probe we clear all pending data before enabling the function,
> 
> Yes we did, but not after resume.

Yes, I understand that. The question I was asking: if we add code
consuming all pending data to f03->suspend(), similarly to what we are
doing at probe time, will it fix the issue with trackstick losing
synchronization and attempting disconnect?

> 
> > maybe the same needs to be done on resume, instead of changing the way
> > we handle IRQ bits?
> 
> This patch is supposed to clear irq status like it in fn probe. Not
> changing IRQ bits.

What I meant is changing how we enable IRQ bits. I would really prefer
we did not lose IRQ state for other functions when we enable interrupts
for given function.

Thanks.

-- 
Dmitry
