Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BAA0E7B7F
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2019 22:41:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731583AbfJ1VlG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Oct 2019 17:41:06 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:17028 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730751AbfJ1VlG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Oct 2019 17:41:06 -0400
Received: from belgarion ([90.55.204.252])
        by mwinf5d17 with ME
        id K9h32100F5TFNlm039h4zn; Mon, 28 Oct 2019 22:41:04 +0100
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Mon, 28 Oct 2019 22:41:04 +0100
X-ME-IP: 90.55.204.252
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 28/46] input: touchscreen: mainstone: sync with zylonite driver
References: <20191018154052.1276506-1-arnd@arndb.de>
        <20191018154201.1276638-28-arnd@arndb.de>
X-URL:  http://belgarath.falguerolles.org/
Date:   Mon, 28 Oct 2019 22:40:58 +0100
In-Reply-To: <20191018154201.1276638-28-arnd@arndb.de> (Arnd Bergmann's
        message of "Fri, 18 Oct 2019 17:41:43 +0200")
Message-ID: <87tv7sk0ph.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> writes:

> +	} else if (machine_is_zylonite()) {
> +		pen_int = 1;
>  	}
I don't understand that part, why do you check for a zylonite board in this file
?

Cheers.

--
Robert
