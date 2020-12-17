Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 543892DD042
	for <lists+linux-input@lfdr.de>; Thu, 17 Dec 2020 12:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgLQLXB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Dec 2020 06:23:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:35492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725950AbgLQLXB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Dec 2020 06:23:01 -0500
Date:   Thu, 17 Dec 2020 12:22:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608204140;
        bh=Tm+HGbC8/QZO5KXeDikdiswzOCci4b6bVSKa8/SFmH8=;
        h=From:To:cc:Subject:In-Reply-To:References:From;
        b=IAVx8ju3z4VC3SXo1riX9rYzhDPTgQUb3m8rAdoWtR3Q4hNmfkf5xey92qYcAU+5j
         k6ZQgceRDkYDnNaa0Z46ETggHDO2/F8fWrRso4HLHj5uMUKzR/sXCEojeGwa70kiRC
         lOKkwddVTL+Rj9HUmouwwknyG89y68bdZHduP42hwVP0TMHBUz0lQMlHuehzLxplXb
         +B/3XLhRB7httwfb8cpgVZJ+vh63cJgH9vODmdsWLbVyfPNuzCNX3qKvHNLWPgO+KM
         Auu8dal2ogHNONnmPcIBVe2DraU9r1ZJp5gLKkxcUekIvpzpV2xHl4lwnMOeCOWJ1A
         HxX74n4QYoZZg==
From:   Jiri Kosina <jikos@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc:     linux-input@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Paul Hollinsky <phollinsky@holtechnik.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: gtco - remove driver
In-Reply-To: <X8wbBtO5KidME17K@google.com>
Message-ID: <nycvar.YFH.7.76.2012171221350.25826@cbobk.fhfr.pm>
References: <X8wbBtO5KidME17K@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 5 Dec 2020, Dmitry Torokhov wrote:

> The driver has its own HID descriptor parsing code, that had and still
> has several issues discovered by syzbot and other tools. Ideally we
> should move the driver over to the HID subsystem, so that it uses proven
> parsing code.  However the devices in question are EOL, and GTCO is not
> willing to extend resources for that, so let's simply remove the driver.

Acked-by: Jiri Kosina <jkosina@suse.cz>

> 
> Note that our HID support has greatly improved over the last 10 years,
> we may also consider reverting 6f8d9e26e7de ("hid-core.c: Adds all GTCO
> CalComp Digitizers and InterWrite School Products to blacklist") and see
> if GTCO devices actually work with normal HID drivers.

Sounds like a good plan to me. Perhaps you can do that in a series 
together, and stage that for 5.12?

Thanks,

-- 
Jiri Kosina
SUSE Labs

