Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E06723207F2
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 02:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhBUB1n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 20:27:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:41756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229819AbhBUB1m (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 20:27:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66F96600CD;
        Sun, 21 Feb 2021 01:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613870821;
        bh=Ii6mCKLdMk+Svk1KpodaVpXsreuwHJe163Dne4id3BY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=U0+VN2V5gNvPL50pnJgblDVyRT5Bb83L9OXDlVceTUPGbFgu5R5kBzc4VQrFa0+PO
         2mcdszsx1ayaupaRs+zEshzLYtA5CJj1PnfQqpF/7qZ2d3EnIyszNI9JPN9eW87HZz
         hukphyheyEnoAgNhsTvHB+Kn+3Sr7gBdrSvJU03Zvlly17zLORNdf1w0x1ELso97ax
         IaC1IG+bxJlT2oYwI/2Q/2hZEL4wEl8U8VohJpDJShKv3UXZD3QLAVx738ZGSZpozU
         b2uLeH8/bvTL3p87kQxr5jIUH2dCZb/ksqOmJxCvhOYrnJOQ40QT/Z4swJlM38MxHW
         pknwx4XDXRu5w==
Date:   Sun, 21 Feb 2021 02:26:57 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/7] HID: lenovo: Use brightness_set_blocking
 callback for setting LEDs brightness
Message-ID: <20210221022657.15f415d6@kernel.org>
In-Reply-To: <20210220122438.21857-2-hdegoede@redhat.com>
References: <20210220122438.21857-1-hdegoede@redhat.com>
        <20210220122438.21857-2-hdegoede@redhat.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>
