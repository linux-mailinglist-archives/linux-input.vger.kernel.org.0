Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E01FD51000
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2019 17:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730548AbfFXPLi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jun 2019 11:11:38 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:57565 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730661AbfFXPLi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jun 2019 11:11:38 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4BFF524000A;
        Mon, 24 Jun 2019 15:11:34 +0000 (UTC)
Message-ID: <c1970f77c797e40717c610ae447e2876eb62e2cb.camel@hadess.net>
Subject: Re: [PATCH] HID: sb0540: add support for Creative SB0540 IR
 receivers
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 24 Jun 2019 17:11:33 +0200
In-Reply-To: <58ee0e02bd6bee1e73f60077b940e0c5d3738253.camel@hadess.net>
References: <58ee0e02bd6bee1e73f60077b940e0c5d3738253.camel@hadess.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2019-06-24 at 13:33 +0200, Bastien Nocera wrote:
> With initial reviews from Benjamin Tissoires.

If anyone has ideas about what to use for the keys I set to
KEY_RESERVED, given the markings on the remotes themselves:
https://github.com/hadess/creative-sb0540

<snip>
> +static const unsigned short creative_sb0540_key_table[] = {
> +	KEY_POWER,
> +	KEY_RESERVED,		/* text: 24bit */
> +	KEY_RESERVED,		/* 24bit wheel up */
> +	KEY_RESERVED,		/* 24bit wheel down */
> +	KEY_RESERVED,		/* text: CMSS */
> +	KEY_RESERVED,		/* CMSS wheel Up */
> +	KEY_RESERVED,		/* CMSS wheel Down */
> +	KEY_RESERVED,		/* text: EAX */
> +	KEY_RESERVED,		/* EAX wheel up */
> +	KEY_RESERVED,		/* EAX wheel down */
> +	KEY_RESERVED,		/* text: 3D Midi */
> +	KEY_RESERVED,		/* 3D Midi wheel up */
> +	KEY_RESERVED,		/* 3D Midi wheel down */
> +	KEY_MUTE,
> +	KEY_VOLUMEUP,
> +	KEY_VOLUMEDOWN,
> +	KEY_UP,
> +	KEY_LEFT,
> +	KEY_RIGHT,
> +	KEY_REWIND,
> +	KEY_OK,
> +	KEY_FASTFORWARD,
> +	KEY_DOWN,
> +	KEY_SELECT,		/* text: Return, symbol: Jump to */
> +	KEY_RESERVED,		/* text: Start */
> +	KEY_RESERVED,		/* Cancel */
> +	KEY_RECORD,
> +	KEY_OPTION,
> +	KEY_RESERVED,		/* text: Display */


