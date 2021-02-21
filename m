Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2F03209F5
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 12:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbhBULaR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Feb 2021 06:30:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:54656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229634AbhBULaP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Feb 2021 06:30:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05E7F64EE6;
        Sun, 21 Feb 2021 11:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613906975;
        bh=Ii6mCKLdMk+Svk1KpodaVpXsreuwHJe163Dne4id3BY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Hg/RZgO7qxllEtTrL+rwIOgLwBckH64fiQbKiNXlL8AzYSvzcxfNBvGyfvQgJnm7X
         A3BNl7/KbTkMm329Fkn5y4jeAe5WPqHPwFs64MmyLQG/1kJbiBrzjwdqhhbrxxwy+D
         MUzSjQmZwUNIJrhBtRDMH54pU4gW7Q6CQZ16ChqyBXxeXEpb+ic+dKogt/ldAdOkb9
         92ESx35CwxZNauEHtcE+oiaUDtz3xHTeB3JRpsSRNloN8gceKCvM1CEMW1CkPlu9f9
         /feOqkMJI3MfpccHMN5KFRiecFdBrb70cEBJl1naM8bSWSXMnv2WxVgUS/wrXfFQVi
         FuSDpxGGekG/w==
Date:   Sun, 21 Feb 2021 12:29:31 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 5/7] HID: lenovo: Set LEDs max_brightness value
Message-ID: <20210221122931.78f9a448@kernel.org>
In-Reply-To: <20210221112005.102116-6-hdegoede@redhat.com>
References: <20210221112005.102116-1-hdegoede@redhat.com>
        <20210221112005.102116-6-hdegoede@redhat.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>
