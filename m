Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCC0E224AAB
	for <lists+linux-input@lfdr.de>; Sat, 18 Jul 2020 12:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgGRKil (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 18 Jul 2020 06:38:41 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:42797 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbgGRKil (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 18 Jul 2020 06:38:41 -0400
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id DF9991C0002;
        Sat, 18 Jul 2020 10:38:36 +0000 (UTC)
Message-ID: <c1ce6d1eaeed9e239742c12f4f82c84ad3f36fd4.camel@hadess.net>
Subject: Re: [PATCH] HID: udraw-ps3: Replace HTTP links with HTTPS ones
From:   Bastien Nocera <hadess@hadess.net>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, mpe@ellerman.id.au,
        benh@kernel.crashing.org, paulus@samba.org,
        linux-input@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Date:   Sat, 18 Jul 2020 12:38:35 +0200
In-Reply-To: <20200718103344.3407-1-grandmaster@al2klimov.de>
References: <20200718103344.3407-1-grandmaster@al2klimov.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 2020-07-18 at 12:33 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Looks good!

Acked-by: Bastien Nocera <hadess@hadess.net>

