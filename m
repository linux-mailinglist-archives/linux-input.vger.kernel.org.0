Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B673843323D
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 11:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234519AbhJSJcd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 05:32:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:39046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234680AbhJSJc3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 05:32:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 785FF6103B;
        Tue, 19 Oct 2021 09:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634635811;
        bh=BZp6+zqCyt3WnAXbIe7YwcoVM/g/8qBj/wywLAwuBPE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=YteivQlPkx6Sua+YdO/53xHnUPHTmhpntpzLfsssXBCPy9ZvLbg1jg+W+mr0o1Nhz
         BkhKQ/FZp6eZ/aZ/69k21BQo2/B5OzdhfwINwBZszwubxdDj+Noczjry8kL7S5AyCG
         Hrymxq8nL5f2HBbfmR3FkUacNAoDzWzCuL2TFVU8hilm0K5jvkw1VPgPBKWVjy7ZOe
         orTGXrI7l7HcgK0/3YbGkEnVLsYXx8UU2YAmWfNhjwFtOtrPQCCQcMf2ZbWPpaXPVP
         TLW9SNaiP/+q39hOf25mKDICWe2d4g0Wj3wABZ4bzDuuQmjAvH7BjO4Cl999ZkenXg
         QgHTQmRftm3hA==
Date:   Tue, 19 Oct 2021 11:30:06 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
cc:     linux-input@vger.kernel.org, Ash Logan <ash@heyquark.com>,
        =?ISO-8859-15?Q?Jonathan_Neusch=E4fer?= <j.ne@posteo.net>,
        =?ISO-8859-2?Q?Barnab=E1s_P=F5cze?= <pobrn@protonmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: Re: [PATCH v3 0/4] HID: wiiu-drc: Add a driver for the Wii U
 gamepad
In-Reply-To: <20211019092737.kudgdeulghx2ig3m@luna>
Message-ID: <nycvar.YFH.7.76.2110191128540.12554@cbobk.fhfr.pm>
References: <20210502232836.26134-1-linkmauve@linkmauve.fr> <20210519085924.1636-1-linkmauve@linkmauve.fr> <20210921150837.ingexwsauvxgluca@luna> <nycvar.YFH.7.76.2110191112490.12554@cbobk.fhfr.pm> <20211019092737.kudgdeulghx2ig3m@luna>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 19 Oct 2021, Emmanuel Gil Peyrot wrote:

> > The code looks good to me, the only question/request I'd have is -- would 
> > it be possible to adhere to the driver naming standards, and actually 
> > incorporate the support to existing hid-nintendo driver? Or is there any 
> > substantial reason which I don't see why this wouldn't be a good idea?
> 
> I don’t see any existing driver named that way in mainline, would it be
> acceptable to simply rename the current patches to hid-nintendo?  What
> should be done about the existing hid-wiimote driver then, should it
> also be merged alongside?

hid-nintendo has just recently been staged for 5.16 in 
hid.git#for-5.16/nintendo git branch. Could you please check that?

> Another driver I’d like to submit eventually is the GameCube Controller 
> Adapter for Wii U, which does exactly what its name says, but being an 
> external USB adapter it also works on any USB computer; would it make 
> sense to develop it alongside the current driver, just because it is 
> sold by the same company?

We generally group the support for HID devices in drivers based on the 
producing company, with a few exceptions where it doesn't make sense.

Thanks,

-- 
Jiri Kosina
SUSE Labs

