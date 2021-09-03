Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50FEE400310
	for <lists+linux-input@lfdr.de>; Fri,  3 Sep 2021 18:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236572AbhICQSC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 3 Sep 2021 12:18:02 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53262 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhICQSB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Sep 2021 12:18:01 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 719691C0B87; Fri,  3 Sep 2021 18:17:00 +0200 (CEST)
Date:   Fri, 3 Sep 2021 18:16:59 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Roderick Colenbrander <roderick@gaikai.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v2 1/3] HID: playstation: expose DualSense lightbar
 through a multi-color LED.
Message-ID: <20210903161659.GA2209@bug>
References: <20210901223037.2964665-1-roderick.colenbrander@sony.com>
 <20210901223037.2964665-2-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20210901223037.2964665-2-roderick.colenbrander@sony.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed 2021-09-01 15:30:35, Roderick Colenbrander wrote:
> The DualSense lightbar has so far been supported, but it was not yet
> adjustable from user space. This patch exposes it through a multi-color
> LED.
> 
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>

Ack.

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
