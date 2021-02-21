Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC5E3207FE
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 02:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbhBUBkn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 20:40:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:42220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229811AbhBUBkm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 20:40:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC4BD64EED;
        Sun, 21 Feb 2021 01:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613871601;
        bh=Ii6mCKLdMk+Svk1KpodaVpXsreuwHJe163Dne4id3BY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OetwCVkqp+1jA95FPsJ6evYrT8K3HyhaxMS55fE9CnqEr2H4k1eoIGlHPWVpuQX8k
         8zrF4ssFoOBQBRGo0uYBStn66yD2Jd6EZEHHLWrAsUPmemo59aMUHiltGTEaQCLf79
         cAyjW3qDB4Z84ab2X3BR1NKfdchtVF1LPkA7Dqe7sGQdBzNcL995EIjlHWIJkngBRv
         B9iq5YB2oyoK9mQhtvLvc6K2P1N7YvOW53Q8+DkIAlPn22WFEt+zMpAud+jI/Z96vR
         eIOef+wkaKn6im9Iku8ZzZd1vFFUnLCJdsThQ0iRc0cD3QRc9JvI0+eoQSg4iH3Tx0
         DhbRVUqMX/njA==
Date:   Sun, 21 Feb 2021 02:39:58 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 4/7] HID: lenovo: Remove lenovo_led_brightness_get()
Message-ID: <20210221023958.020548a1@kernel.org>
In-Reply-To: <20210220122438.21857-5-hdegoede@redhat.com>
References: <20210220122438.21857-1-hdegoede@redhat.com>
        <20210220122438.21857-5-hdegoede@redhat.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>
