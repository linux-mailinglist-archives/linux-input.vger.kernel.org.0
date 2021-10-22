Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F7D4371FD
	for <lists+linux-input@lfdr.de>; Fri, 22 Oct 2021 08:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbhJVGo3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Oct 2021 02:44:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:56172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230295AbhJVGo2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Oct 2021 02:44:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2F3E60F50;
        Fri, 22 Oct 2021 06:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634884930;
        bh=1INCxEH62P29LSIrZWHi/J9TAwIAyqS70hH2bHznHFs=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=fYMlRqM4ukk+jEERqDB9VSxaSkUGvm6wU96vEKebW/a+Qr6N3Bf0gJoijlxUf7YN2
         1cTuln9U5paEE9DOYavfdGDFEp1FT+YnMFMfT7QhIe9ocYBMuWBAGmcMxJ3FMkCEqM
         4TjQD/2DDUnEsTUyW1+uhscawZQOXLIBuDAzbew3X9AwDa7cOehhU8wEyI2v44Q3G9
         OaDgeSPM5FDju+hvluXXSnsodlSaq9Bd4mT4CWvb2Nk4+sO0HiSQvEuQeLSD09GmaZ
         kuJItNrM+EgD6tOX6qLfEjZIzgS2SuUcBe3KKz4wpdYyIcsEqqX28mn5gni8jS378s
         /Mjdsh6JRRA8A==
Date:   Fri, 22 Oct 2021 08:42:06 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
cc:     Roderick Colenbrander <thunderbird2k@gmail.com>,
        Roderick Colenbrander <roderick@gaikai.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v3 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs
 for game controllers.
In-Reply-To: <nycvar.YFH.7.76.2110181739310.12554@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.2110220840340.12554@cbobk.fhfr.pm>
References: <20210908165539.3102929-1-roderick.colenbrander@sony.com> <20210908165539.3102929-3-roderick.colenbrander@sony.com> <nycvar.YFH.7.76.2109221150110.15944@cbobk.fhfr.pm> <20210927141109.GB5809@duo.ucw.cz> <CAEc3jaCxBn=2UU5bDva0mnjhwJpQBwKqmWnyAwFDNjBAV7MBng@mail.gmail.com>
 <20211013074849.GA10172@amd> <nycvar.YFH.7.76.2110181739310.12554@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 18 Oct 2021, Jiri Kosina wrote:

> > Ok, so let's put it in the common place. I'll take this patch through
> > LED tree if you resubmit it. You still may want to use local defines
> > so you can apply the other patches without waiting.
> 
> Pavel, why complicate it so much? Given how trivial the patch is, the 
> easiest way is what's usually done in such cases (where substantial patch 
> depends on a tiny trivial change elsewhere) -- take it through HID tree 
> with your Reviewed-by / Acked-by:.
> 
> Do you see any issue with that?

Pavel, another week has passed. I am considering just including the 
trivial LED #define additions and take them through hid.git unless I hear 
from you today.

Thanks,

-- 
Jiri Kosina
SUSE Labs

