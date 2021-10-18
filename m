Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A9D432321
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 17:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232376AbhJRPmv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 11:42:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:50506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232164AbhJRPmr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 11:42:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20AEE60F44;
        Mon, 18 Oct 2021 15:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634571631;
        bh=HUd0g/z/EO0D4YBzcpbH+S+qKvPv6M+AkEmBASmlmcE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=PknwlF4t/mWb06wqPPCkmgczIasP8nxPClxmEW+bU8FIddaQdupLVPhZZX3IKOEm3
         wnHtNgk/LcaLNhr68EiQniEUlfQM4u7+nsZgHdLDUuP+KunH4l7nfyMDPt5VLWfVA7
         303HGSn34ig/KtX5NlO0015YLVbZqOlIOG70Kb2Y1HF9Gtqga4dpSk40vd3AoRguW2
         BSt0t0h7vP5L1uOCXrBR7hG26e1UU4WTqqR4IHfQS8wF5codmCWe8SBzaZlXQb2nmh
         2cWdZL73zT9Nfc+ADOEt0PjHNBVETawx7HmEaZd5G7NMTDQae4OvbACw0Y4+qLd/Mj
         wa5/OG2xYqL7A==
Date:   Mon, 18 Oct 2021 17:40:27 +0200 (CEST)
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
In-Reply-To: <20211013074849.GA10172@amd>
Message-ID: <nycvar.YFH.7.76.2110181739310.12554@cbobk.fhfr.pm>
References: <20210908165539.3102929-1-roderick.colenbrander@sony.com> <20210908165539.3102929-3-roderick.colenbrander@sony.com> <nycvar.YFH.7.76.2109221150110.15944@cbobk.fhfr.pm> <20210927141109.GB5809@duo.ucw.cz> <CAEc3jaCxBn=2UU5bDva0mnjhwJpQBwKqmWnyAwFDNjBAV7MBng@mail.gmail.com>
 <20211013074849.GA10172@amd>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 13 Oct 2021, Pavel Machek wrote:

> Ok, so let's put it in the common place. I'll take this patch through
> LED tree if you resubmit it. You still may want to use local defines
> so you can apply the other patches without waiting.

Pavel, why complicate it so much? Given how trivial the patch is, the 
easiest way is what's usually done in such cases (where substantial patch 
depends on a tiny trivial change elsewhere) -- take it through HID tree 
with your Reviewed-by / Acked-by:.

Do you see any issue with that?

Thanks,

-- 
Jiri Kosina
SUSE Labs

