Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46AC643C461
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 09:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240626AbhJ0Hwp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 03:52:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:41088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237112AbhJ0Hwp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 03:52:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B32E860EB4;
        Wed, 27 Oct 2021 07:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635321020;
        bh=oMwVXe5Y0ux7izuBtakG4RkkJ292qY28duQZJ7JKNIo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=pFXjCXa7maz2TDCHTuDoFKWpQVtRSaL/DZW8+/KAjlDI61Ku4m85amHM1U9tNyn1A
         DwNQcG0XSa8uVO0GcYV+LqjewGWQV/Yn5GoZETEtMnTlvsFFyXAAapxexMnYoSrtE2
         AcjwUAPBvahJ890U0lUej1iO3da1jTDQ6ILZZdZDUY+s+hCmzk5tQiTQeUF8zmHgv8
         XyFgYGK1Tb26SB30OfQs7ho+I9CweZpTm/iVaxQfri5B7cd+/aDLcGxgiOWtjCBwFo
         RE7G37CXizTV8NyEjNj1TeHc4wD6p/DgVC735DxaXZ9AngL+3+haeQwKmQnBOzX9kG
         KAn6uH7EEf4LA==
Date:   Wed, 27 Oct 2021 09:50:16 +0200 (CEST)
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
In-Reply-To: <20211026184847.GA25683@duo.ucw.cz>
Message-ID: <nycvar.YFH.7.76.2110270949590.12554@cbobk.fhfr.pm>
References: <20210927141109.GB5809@duo.ucw.cz> <CAEc3jaCxBn=2UU5bDva0mnjhwJpQBwKqmWnyAwFDNjBAV7MBng@mail.gmail.com> <20211013074849.GA10172@amd> <nycvar.YFH.7.76.2110181739310.12554@cbobk.fhfr.pm> <nycvar.YFH.7.76.2110220840340.12554@cbobk.fhfr.pm>
 <20211022072115.GA25215@amd> <nycvar.YFH.7.76.2110220924340.12554@cbobk.fhfr.pm> <nycvar.YFH.7.76.2110220931190.12554@cbobk.fhfr.pm> <20211025091929.GA5878@amd> <nycvar.YFH.7.76.2110251127380.12554@cbobk.fhfr.pm> <20211026184847.GA25683@duo.ucw.cz>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 26 Oct 2021, Pavel Machek wrote:

> > Can I take this as your Acked-by: then, so that I can finally apply it and 
> > get the needed linux-next coverage before merge window opens?
> 
> Yes.

Thanks. The whole series is now in hid.git#for-5.16/playstation

-- 
Jiri Kosina
SUSE Labs

