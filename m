Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17234D84C5
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2019 02:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387839AbfJPAXd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Oct 2019 20:23:33 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46683 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388055AbfJPAXd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Oct 2019 20:23:33 -0400
Received: by mail-pf1-f194.google.com with SMTP id q5so13502203pfg.13;
        Tue, 15 Oct 2019 17:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=w/0NNjZTTRzygNruX3+tb9DR5aFHlsjqWF+laA/0wOw=;
        b=lBBLAc/yj2i06gSUC9ce8AFd26klCFmFUF/isgFFJy5uu2uxvwHPVhl8ZCJBVgiNBS
         cJKYwX0kMk/ZKHppUWvOPIZl82RfpuyWE2RnD/cRTRmpDEUw0bB7UnZwBLyiyH2W/DyC
         N28FlE+zCE4IYGsHAR+EOmnBfGknMRjbewrSNzLSnjlwON/0awOmbOVdeJJJgjN6IAyN
         AeyLXzEhz8PPAYfGETW70cgbj8dwjvBEdjff0c72rCVcGAQ56M/ZwsNu4m0VJPDXN8oh
         faYhkKWJe9jDRtWHwcULvwwwE2y/kMBXix/ibzKMDyzmFsLlVqj1bTyKMWPDoVQl8jGa
         +7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=w/0NNjZTTRzygNruX3+tb9DR5aFHlsjqWF+laA/0wOw=;
        b=P0Kb3XJBqcMEpMCRWSA8RWokRzJZXQSYcm17+1asEXM74gCG8B++EGiu19ujTY5H8J
         NygNi3YcA+aYdXY0aAeeae+p2HhBYWWiumj7ECt1CN96JHNnv6aCz144SnT05g2vCflM
         qjq0I8OYauAxkOBDJOhvO/tOt8+eA/67HbqWTfel1d5+CpvLWP1JLTegWe3ipjjH4SvD
         BWpNikZ9NPi423cFYllWONUteMAzs2DapggEWt9Doe/6xGuKrdGPhWzvdEiH/6IDWqkN
         MZgpCBHOW1cxGu2z14pgBqs8qm1xCNG/RQO9RuXYv4WnjZe9lH4Bpi1jNOUfceWZiuLF
         SUnQ==
X-Gm-Message-State: APjAAAVuxTEcbDUsSt4qcqbRS72ktLjM27VpDLBCqEbXw8DEoUzShIKN
        f3JVDjrRFvjYzA2JNko2oaUPvX/F
X-Google-Smtp-Source: APXvYqwC+wjxbfMy2WAXu0bueat9paoo3FeKRKQpcvvlZd1fECIKrRk9z/O7SPxyXgpRTEs3pY/9gQ==
X-Received: by 2002:a65:6394:: with SMTP id h20mr40985351pgv.272.1571185411778;
        Tue, 15 Oct 2019 17:23:31 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id q15sm20647893pgl.12.2019.10.15.17.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 17:23:30 -0700 (PDT)
Date:   Tue, 15 Oct 2019 17:23:28 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc:     Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: input: Add poll-interval property
Message-ID: <20191016002328.GJ105649@dtor-ws>
References: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
 <1570083176-8231-4-git-send-email-michal.vokac@ysoft.com>
 <20191010194036.GA16869@bogus>
 <20191010200136.GA229325@dtor-ws>
 <1616be35-c06a-db84-bc6e-045195f163d7@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1616be35-c06a-db84-bc6e-045195f163d7@ysoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 11, 2019 at 10:03:25AM +0200, Michal Vokáč wrote:
> On 10. 10. 19 22:01, Dmitry Torokhov wrote:
> > On Thu, Oct 10, 2019 at 02:40:36PM -0500, Rob Herring wrote:
> > > On Thu, Oct 03, 2019 at 08:12:54AM +0200, Michal Vokáč wrote:
> > > > Add an option to periodicaly poll the device to get state of the inputs
> > > > as the interrupt line may not be used on some platforms.
> > > > 
> > > > Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> > > > ---
> > > > Changes since v2:
> > > >   - None
> > > > 
> > > > Changes since v1:
> > > >   - Use poll-interval instead of linux,poll-interval.
> > > >   - Place the poll-interval binding into the common schema.
> > > >   - Properly describe that either interrupts or poll-interval property is
> > > >     required.
> > > >   - Fix the example to pass validation.
> > > > 
> > > >   .../bindings/input/fsl,mpr121-touchkey.yaml        | 25 +++++++++++++++++++++-
> > > >   Documentation/devicetree/bindings/input/input.yaml |  4 ++++
> > > >   2 files changed, 28 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> > > > index c6fbcdf78556..035b2fee4491 100644
> > > > --- a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> > > > +++ b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> > > > @@ -17,6 +17,10 @@ description: |
> > > >   allOf:
> > > >     - $ref: input.yaml#
> > > > +oneOf:
> > > 
> > > It should be valid to have both properties present, right?
> > 
> > The poll does not really sense and does not have any effect when
> > interrupt is supplied.
> 
> From technical point of view, yes it is possible to have both
> properties. But I agree that it does not really make sense to
> use both at the same time.
> 
> > > The h/w description can't know what the OS supports.
> > 
> > It also has no idea what OS does at all and whether it even pays
> > attention to any of these properties. We are just trying to say here "I
> > do not have an interrupt wired, so for this device's primary use case
> > (that is coupled with a certain $PRIMARY OS) we need to poll the
> > controller ever so often to handle our use case".
> 
> If I understand correctly the relationship between Linux and DT
> binding, in Linux we are free to implement just part of all the
> possible configuration options described by the binding.
> 
> In this case if somebody would enable both interrupt and polling,
> we will happily use the interrupt mode only. Maybe it would be nice
> to at least print a message that the poll-intervall is ignored?
> 
> > > In that case, we should use 'anyOf' here instead.
> 
> What I am afraid of is that some DT writers may really use both
> properties and expect that Linux will actually do something useful
> in this case. Anyway, I am OK with that.

OK, I changed it to "anyOf", folded into driver change and applied.

-- 
Dmitry
