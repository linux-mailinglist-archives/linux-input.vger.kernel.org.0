Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72D473D8AB1
	for <lists+linux-input@lfdr.de>; Wed, 28 Jul 2021 11:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbhG1JfY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Jul 2021 05:35:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:50606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231256AbhG1JfY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Jul 2021 05:35:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F59960F9C;
        Wed, 28 Jul 2021 09:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627464922;
        bh=ZFlNU8gErRjsVMCLu4rJ1Ks8RvhUkcDIrTmRzVt4UVA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=P3EbQXRPKzM97REctr3u95onA7Vv2QGzXE8I+ovF28eJob80Mz3W0Z2NWYpwUvc/O
         +MPe4HR7zur3+5Im6v6nacoKf8rfbShU2qHb7Y1hM7BU/o8NBSTg6nqy3EfHCpy1/F
         SOxwXEi1ZrK7Gnr6/IHwuitCOk5k5OEWg1POCwHwNHIeUNhePkaLmas5AB8GhJ0kTS
         vh32W1FxozaeqSuW8wBngn96kcoLmjl7ZebI6mhWaRgji++I4Pfi2uGAjHFnPs5/li
         lcP0YPMAyEb/lXz7JC8GZPzRD9c8nT3dOAnKDMSbk+8iqZ//xsQAcwg2Vt4skX0yz2
         0P4NmGOm/D2wA==
Date:   Wed, 28 Jul 2021 11:35:20 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] HID: magicmouse: register power supply
In-Reply-To: <20210625170834.GA9573@elementary-os.localdomain>
Message-ID: <nycvar.YFH.7.76.2107281134430.8253@cbobk.fhfr.pm>
References: <20210522180611.314300-1-jose.exposito89@gmail.com> <nycvar.YFH.7.76.2106241532511.18969@cbobk.fhfr.pm> <20210625170834.GA9573@elementary-os.localdomain>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 25 Jun 2021, José Expósito wrote:

> > > [...]
> > > v2: Add depends on USB_HID to Kconfig
> > 
> > Hmm, why is this dependency needed in the first place, please? I think 
> > trying to keep the drivers independent on transport drivers (especially in 
> > cases like this, where more variants of physical transports actually 
> > really do exist) is worth trying.
> 
> Sorry, that's something I should have explained in the changelog.
> 
> Intel's test bot reported compilation errors on the first version of the patch
> when USB support wasn't configured:
> https://lore.kernel.org/patchwork/patch/1425313/
> 
> I was kindly pointed to a similar error and its fix, but, maybe in this case this
> is not the right fix?
> Maybe there is a macro that I can use to wrap the USB related code in an #ifdef?

It can certainly be wrapped, but looking into the code now, it probably 
wouldn't really bring more clarity. I will apply the series with adding 
the USB_HID dependency for now.

Thanks,

-- 
Jiri Kosina
SUSE Labs

