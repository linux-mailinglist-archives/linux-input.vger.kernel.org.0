Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D63163207FB
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 02:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbhBUBkB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 20:40:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:42200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229811AbhBUBj6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 20:39:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BDF264EEC;
        Sun, 21 Feb 2021 01:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613871557;
        bh=Ii6mCKLdMk+Svk1KpodaVpXsreuwHJe163Dne4id3BY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CBkpspEUVRH0cMdG8b8tYnWXqQKJWjdxikY6qAJzR53pwfUE4NSil8qeq+WdrflX2
         3wYg7zdwP9yIG4cC9Daw8/NAlcfEunSOp1Cqeus2ja/nZ/2m0OxXkNViO9Mysl/ZUY
         5zI5W+bRySZuUkqrZb1Co12FA3GresYkeM31X300QMRfyosRZ/HWlH2NujucUo55lj
         OhN+6LS6K8uBktmGOBca9bCSk5OSY5k8k0CR533JNCM5qBqfKcvr4e9wve5q8vSGUK
         omMSQuibWJsKyycA0aJ3zFKCKpPwqr/X4sJX0JuGpLfAUkGnz5hsn4iF32ObDIksq0
         7Hvg3eEQitung==
Date:   Sun, 21 Feb 2021 02:39:13 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 3/7] HID: lenovo: Check hid_get_drvdata() returns non
 NULL in lenovo_event()
Message-ID: <20210221023913.6f7b2a5e@kernel.org>
In-Reply-To: <20210220122438.21857-4-hdegoede@redhat.com>
References: <20210220122438.21857-1-hdegoede@redhat.com>
        <20210220122438.21857-4-hdegoede@redhat.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>
