Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE8543C4B0
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 10:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240767AbhJ0ILH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 04:11:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:45538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240770AbhJ0ILG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 04:11:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB9E4610E5;
        Wed, 27 Oct 2021 08:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635322121;
        bh=8f7OoI3Pjt1IvfUgZ4mZhJ6VWS/mJ5xGsiikkVsr+Wo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=E0W4mUg4r6exDDdYBY4kZMQmAqqrdvHSZcAnnK1Lo36XM9e2uJR0wX57AtzpPgFtz
         dPINiAl7XZC04c/tfsN/YgPOXcUyyFgm9vvU9aYpj1CnEgoxFnqEYmjK6Hqz81Ptte
         DJz3uKQw3zvgYu1iKip8rMZD9FHPxnnWC/ToQFJ5GBExHu9t0A6oG3ILcwH8+SmckC
         p/Xdw03IFPAH7pQP0KOzdyMSNBZqgNvRf3Z6DyPJ/Y12fQKaskgijGTVw6SyA235NL
         E6yW3fvwOOMAqnoTW2bsRe5Uoea32LjetzIQkKyi6ASuIStBphDn5SZARvGkfr+Te8
         BAIA5pcZmlKMA==
Date:   Wed, 27 Oct 2021 10:08:36 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
cc:     linux-input@vger.kernel.org, thunderbird2k@gmail.com,
        blaws05@gmail.com, benjamin.tissoires@redhat.com,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com, lee.jones@linaro.org,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v16 00/16] HID: nintendo
In-Reply-To: <nycvar.YFH.7.76.2110191142160.12554@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.2110271007450.12554@cbobk.fhfr.pm>
References: <20210911173639.5688-1-djogorchock@gmail.com> <nycvar.YFH.7.76.2110191054080.12554@cbobk.fhfr.pm> <nycvar.YFH.7.76.2110191142160.12554@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 19 Oct 2021, Jiri Kosina wrote:

> Benjamin noticed that I pushed wrong version of the branch -- the one that 
> still doesn't contain the LED_FUNCTION_PLAYER[1-5] defines, which I've had 
> staged here locally, waiting for Pavel's Ack (which is taking time, 
> unfortunately).
> 
> So please ignore this branch for now, I'll push v2 once that situation is 
> cleared out.
> 
> CCing Pavel as well here to make him aware of the issues this is causing 
> all over the place (see .e.g my mail [1] from yesterday).
> 
> [1] https://lore.kernel.org/all/nycvar.YFH.7.76.2110181739310.12554@cbobk.fhfr.pm/

As we got Ack for the LED_FUNCTION_PLAYER[1-5] patch, this has now been 
revived and version that actually builds pushed to hid.git.

Thanks,

-- 
Jiri Kosina
SUSE Labs

