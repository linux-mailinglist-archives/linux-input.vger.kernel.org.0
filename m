Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4167F29C864
	for <lists+linux-input@lfdr.de>; Tue, 27 Oct 2020 20:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S371912AbgJ0TK7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Oct 2020 15:10:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:42854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S371907AbgJ0TKv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Oct 2020 15:10:51 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 32F6020756;
        Tue, 27 Oct 2020 19:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603825849;
        bh=0LhJAkuDJj/WQXvv2wdSS/1W6NuneKemHgAE29jp9BU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=1hpemIWHwCC0M2PrsvzXwI7hbqSd7DBSEJZd7OEVjp61IMLwx/2m4San5jsKZnOhg
         dicsjWY4o8r8rIhgSrJ7FeQYeIOySEbyM+TL1p8NhRA9xuI4Zij8mbxoX5L4XYTNuy
         YnGuoNpJ+q7yeyPu8c7s85C9+dGABlK8yjN8E+vU=
Date:   Tue, 27 Oct 2020 20:10:46 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
cc:     dmitry.torokhov@gmail.com, vojtech@suse.cz,
        linux-input@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>
Subject: Re: Proper support for Saitek X36F joystick
In-Reply-To: <20201027124235.GA27148@duo.ucw.cz>
Message-ID: <nycvar.YFH.7.76.2010272006490.18859@cbobk.fhfr.pm>
References: <20201027124235.GA27148@duo.ucw.cz>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 27 Oct 2020, Pavel Machek wrote:

> Hi!
> 
> This is from 4.19, but I doubt this changed recently.
> 
> Saitek X36F+X35T combination is detected like this... in short one
> hat, no switches, and lot of buttons.
> 
> In reality, combination has 4 four-way switches (hats?), 2 slider
> switches (three positions) and lot less buttons. Sliders and 3 of 4
> hats are detected as groups of buttons. Last hat is strange, I can't
> see anything that corresponds to it on evtest, and as long as it is
> pushed in any direction, all the other events stop. (It is also one
> I'd like to use).
> 
> What needs to be done to get more useful mapping for userspace?

It wouldn't be the first device produced by Saitek that has completely 
bogus report descriptor.

The most straightforward way would be to let hid-saitek module claim the 
device, and fix the report descriptor (saitek_report_fixup()) before it's 
passed to hid parser so that it actually describes the events produced.

You can either patch individual bytes (that's what saitek_report_fixup() 
is currently doing for another device), or replace the whole descriptor 
completely (see e.g. hid-kye for inspiration how this is done).

-- 
Jiri Kosina
SUSE Labs

