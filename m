Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA00039E942
	for <lists+linux-input@lfdr.de>; Tue,  8 Jun 2021 00:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbhFGWEf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Jun 2021 18:04:35 -0400
Received: from smtprelay0205.hostedemail.com ([216.40.44.205]:49756 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230359AbhFGWEf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 7 Jun 2021 18:04:35 -0400
Received: from omf04.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id D089D837F24D;
        Mon,  7 Jun 2021 22:02:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf04.hostedemail.com (Postfix) with ESMTPA id B12A8D1514;
        Mon,  7 Jun 2021 22:02:41 +0000 (UTC)
Message-ID: <91eef5ab3143ae8fadb8eb2969aecba5f3e7ad98.camel@perches.com>
Subject: Re: [PATCH][next] Input: Fix fall-through warning for Clang
From:   Joe Perches <joe@perches.com>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Kees Cook <keescook@chromium.org>
Date:   Mon, 07 Jun 2021 15:02:40 -0700
In-Reply-To: <20210607214852.GA65141@embeddedor>
References: <20210607214852.GA65141@embeddedor>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B12A8D1514
X-Spam-Status: No, score=-0.65
X-Stat-Signature: ynu6jtzcnxw8izy8nxad333mwtbwtion
X-Rspamd-Server: rspamout03
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18hRqlM6OTNhLYnzoh+elKVaVujchnKqRk=
X-HE-Tag: 1623103361-870172
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2021-06-07 at 16:48 -0500, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a
> warning by explicitly adding a fallthrough; statement.
[]
> diff --git a/drivers/input/joystick/sidewinder.c b/drivers/input/joystick/sidewinder.c
[]
> @@ -660,6 +660,7 @@ static int sw_connect(struct gameport *gameport, struct gameport_driver *drv)
>  					fallthrough;
>  				case 45:				/* Ambiguous packet length */
>  					if (j <= 40) {			/* ID length less or eq 40 -> FSP */
> +					fallthrough;
>  				case 43:
>  						sw->type = SW_ID_FSP;
>  						break;

Yuck.  Super ugly.  There's no need to play games with indentation.

Perhaps the simpler:

				case 43:
					sw->type = SW_ID_FSP;
					break;
				case 45:				/* Ambiguous packet length */
					if (j <= 40) {			/* ID length less or eq 40 -> FSP */
						sw->type = SW_ID_FSP;
						break;
					}
					sw->number++;
					fallthrough;


