Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA5C225C96
	for <lists+linux-input@lfdr.de>; Mon, 20 Jul 2020 12:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbgGTKZM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jul 2020 06:25:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:32832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728001AbgGTKZM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jul 2020 06:25:12 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2271720773;
        Mon, 20 Jul 2020 10:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595240711;
        bh=0yBRtrgV0oqduFYbAUYHsxtbhEuVwVxiP2Pd1Cr8R58=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=l67PkE/RzLWY5IkeqGPvMecT7x4zFXpW12kIP45RZ86WvEb1Sn2xYUErgiyS7zR9z
         iM2UJUxFBVI/8PD3ncVI0Mai9Pu8CnDc5m7WdPOC/BneNLu8+xOGjjEPpmJ4VYRApH
         9NNGRJbatWfF0q4no1fNxX30JZtn0YsjBF4Qjuuc=
Date:   Mon, 20 Jul 2020 12:25:08 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Bastien Nocera <hadess@hadess.net>
cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        benjamin.tissoires@redhat.com, mpe@ellerman.id.au,
        benh@kernel.crashing.org, paulus@samba.org,
        linux-input@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: udraw-ps3: Replace HTTP links with HTTPS ones
In-Reply-To: <c1ce6d1eaeed9e239742c12f4f82c84ad3f36fd4.camel@hadess.net>
Message-ID: <nycvar.YFH.7.76.2007201225020.23768@cbobk.fhfr.pm>
References: <20200718103344.3407-1-grandmaster@al2klimov.de> <c1ce6d1eaeed9e239742c12f4f82c84ad3f36fd4.camel@hadess.net>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 18 Jul 2020, Bastien Nocera wrote:

> > Rationale:
> > Reduces attack surface on kernel devs opening the links for MITM
> > as HTTPS traffic is much harder to manipulate.
> > 
> > Deterministic algorithm:
> > For each file:
> >   If not .svg:
> >     For each line:
> >       If doesn't contain `\bxmlns\b`:
> >         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> > 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
> >             If both the HTTP and HTTPS versions
> >             return 200 OK and serve the same content:
> >               Replace HTTP with HTTPS.
> > 
> > Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> 
> Looks good!
> 
> Acked-by: Bastien Nocera <hadess@hadess.net>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

