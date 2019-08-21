Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2348097F9E
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 18:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbfHUQD6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 12:03:58 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37240 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727480AbfHUQD5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 12:03:57 -0400
Received: by mail-pl1-f196.google.com with SMTP id bj8so1567453plb.4;
        Wed, 21 Aug 2019 09:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=sK36cCquOF5JpYDhHcSG882sVJ66GrerDAKUpKFlmIE=;
        b=IhDkcYFGbn1FO+a2df3L+AbR0/WlPpfhzlf2+iWjRX/wBpscNkz0csaFfwGDd+URM3
         4DlOPjjAAw7NPlmjwg7u5XqjdXUAgORMHpnUUWwuAQQjMOzhQuDCV9cNleTI5RHP9fDQ
         vXRtFdI9V0QwEjW64jbjcj+jlHudt6UjQpDvXpIj3qrhzoE2v6fByR4dTTRVx7hAj3/P
         P6TEEvo6w7IVflPOvpI6sBCrxNQDKAfE+6M+fthXVlAFyd8eUY2htE6odPeUtHq9PeCW
         IcNlg25akBgBMZNTBNiHP+8l4rBbvX9SocgAwTaFBx9TyvLbDgPNnr1W14w/VyZ0E4rJ
         IDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=sK36cCquOF5JpYDhHcSG882sVJ66GrerDAKUpKFlmIE=;
        b=KuqgKg9RdX7+rGPKNbBmR5bm6HVOkibcW8IVEoWVsGhg3v+f/D7ApsYSmFGq4byXNN
         Sm8vHG0X06MXIRZo5iFriSjotGYFYj/bMTd+qoACrPbilsXvSCyVb6Z5cdhS420xfR1z
         JVhwF4UoZH8hVMDE8hHUNoZSiJH9DxW2FJE6w7P5G5z9D3Cp410ioPQe5+xPW+lyGnCH
         mhK7wQERdhKuDVv9Pr7narCChPf4O0xlQuMQy9bOCYvpsiEZHuHg79m7eVNDZq3EzXJW
         /eq8YjYNu5x10sxUntYFAUN843VDFzw66lzBW27BTYktqaJaBx9mzePz8opn8Nyzpdod
         2gEg==
X-Gm-Message-State: APjAAAUerWWRRgcrDBa0XpdWBUKqnV6D1Ej9R4BHU30/Tm27l/ji1t/c
        NJlOqCqXvDeo2t0yur9Ml4Q=
X-Google-Smtp-Source: APXvYqzNqXSENxzGkZjNibXp0JX98LVS/d77pjQZhkQt3ndUJTQnJfzh95dd/VhbttVkaAPoXOz7WA==
X-Received: by 2002:a17:902:1123:: with SMTP id d32mr3649506pla.218.1566403436201;
        Wed, 21 Aug 2019 09:03:56 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id e9sm32640892pfh.155.2019.08.21.09.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 09:03:53 -0700 (PDT)
Date:   Wed, 21 Aug 2019 09:03:51 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= 
        <thomas_os@shipmail.org>
Cc:     linux-kernel@vger.kernel.org, pv-drivers@vmware.com,
        Thomas Hellstrom <thellstrom@vmware.com>,
        linux-input@vger.kernel.org, Doug Covelli <dcovelli@vmware.com>
Subject: Re: [PATCH 4/4] input/vmmouse: Update the backdoor call with support
 for new instructions
Message-ID: <20190821160351.GA76194@dtor-ws>
References: <20190818143316.4906-1-thomas_os@shipmail.org>
 <20190818143316.4906-5-thomas_os@shipmail.org>
 <20190821050925.GA566@penguin>
 <027a55d6-ab26-ef9c-bd89-93a38f96160b@shipmail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <027a55d6-ab26-ef9c-bd89-93a38f96160b@shipmail.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 21, 2019 at 05:48:23PM +0200, Thomas Hellström (VMware) wrote:
> On 8/21/19 7:09 AM, Dmitry Torokhov wrote:
> > On Sun, Aug 18, 2019 at 04:33:16PM +0200, Thomas Hellström (VMware) wrote:
> > > From: Thomas Hellstrom <thellstrom@vmware.com>
> > > 
> > > Use the definition provided by include/asm/vmware.h
> > > 
> > > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Cc: <linux-input@vger.kernel.org>
> > > Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
> > > Reviewed-by: Doug Covelli <dcovelli@vmware.com>
> > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > Please feel free to merge with the rest of the patches introducing
> > VMWARE_HYPERCALL.
> 
> Thanks, Dmitry!
> 
> I have a version 2 of the patch were the only difference is that edx is
> initialized to zero which is default for vmcall / vmmcall. Can I use your
> ack for that one as well?

Yes, sure.

-- 
Dmitry
