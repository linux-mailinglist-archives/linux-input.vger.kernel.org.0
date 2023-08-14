Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B63F977B580
	for <lists+linux-input@lfdr.de>; Mon, 14 Aug 2023 11:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbjHNJ3M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Aug 2023 05:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233792AbjHNJ3E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Aug 2023 05:29:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62065AB;
        Mon, 14 Aug 2023 02:29:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA6F2643BA;
        Mon, 14 Aug 2023 09:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3EAC433C8;
        Mon, 14 Aug 2023 09:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692005342;
        bh=xzoU4huHD7rgPJJKkeiwAdRYCi0mmbAhDk3mLAhamDg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=crYKC90hVSo/RGPhKHemMdgSP51dVavRtWrP3SWrIvV3lEka/srTEqVue3G+lu1oN
         +DapQi92IzSbVkGemnTOVE5Gzcq0eGRqXGI2b3SnILgccumTPnSG4AZluqqIeAld1i
         6m/OHx+esmT8h3MrATLWYr7WSXRsyRPeDIMUK7NDDBOaMhFG2L2poQcBotHgxhs+oR
         cBcdEHmoVpxBIaW+YgyZZf/iGIPVpQj9a20R1zcrnxvvof828qSG7KFHVDzLePvylv
         /6NnPD5Enyg9RD7ymaLzT7Phmmw5sADemPiJrLr5z5rIk3/2ENac++1mFfmB4vypFq
         RKjLeMDOwSPUw==
Date:   Mon, 14 Aug 2023 11:28:58 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH v1 00/12] HID: cp2112: Cleanups and refactorings
In-Reply-To: <ZND/8wd67YbGs8d5@smile.fi.intel.com>
Message-ID: <nycvar.YFH.7.76.2308141128260.14207@cbobk.fhfr.pm>
References: <20230703185222.50554-1-andriy.shevchenko@linux.intel.com> <ZMK60UphgVuj4Z+L@smile.fi.intel.com> <ZMydcGv8Dvu3Hje1@smile.fi.intel.com> <nycvar.YFH.7.76.2308071319140.14207@cbobk.fhfr.pm> <ZND/8wd67YbGs8d5@smile.fi.intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 7 Aug 2023, Andy Shevchenko wrote:

> > > > > After I updated GPIO library for the case Benjamin has with CP2112,
> > > > > I have a brief look into the CP2112 driver itself.
> > > > > 
> > > > > From GPIO perspective it has two main (maitenance) issues:
> > > > > - usage of ->to_irq() with IRQ chip present;
> > > > > - having IRQ chip not immutable.
> > > > > 
> > > > > Besides that there are plenty small cleanups here and there.
> > > > > Hence this series.
> > > > 
> > > > Any comments on this?
> > > 
> > > Gentle ping^2 for this...
> > > 
> > > Anything should I do to improve it or is it okay to go as is?
> > 
> > I have been off pretty much the whole July. I am now back and slowly 
> > making my way through everything that accumulated, I will eventually get 
> > to this.
> > 
> > Thanks for the patience,
> 
> Ah, okay, no worries and take your time!
> 
> I was thinking more on Benjamin's answer as last time he had a hw setup
> to test... Not sure what the status of that now and if he has a chance
> to test this or busy enough with something else.

Ah, that would be of course nice. Benjamin?

Thanks,

-- 
Jiri Kosina
SUSE Labs

