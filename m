Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E09F3209F8
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 12:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhBULak (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Feb 2021 06:30:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:54696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229634AbhBULaj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Feb 2021 06:30:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 695B964EE9;
        Sun, 21 Feb 2021 11:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613906998;
        bh=Ii6mCKLdMk+Svk1KpodaVpXsreuwHJe163Dne4id3BY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=d2UE9/90wdqjqqFrZcVN+lTrlsYm+8czUPx5JO6BrG/WVVOqbOaiL5ATqk5/0egaE
         dJnljpBaBvbmOplzqcx01DAQBW0CuXXdMjM4XR41EMTG+zVaeZxCGgTQEVIp7ddpLM
         RVo4YCqXp22TWQUr7E5zuS8OCeJb76svRj3Ccff10+KuxERfmJf6zNcAuMlL0nhp1D
         uSRJjtz3c3vJv0iphQWJ+Zqe02+q4i2M2cU54DLVi/FzKQPCCAFjtZSjlPg8ru2FLc
         0gobWBdFuswyDj1IUlaQjrID+S7n3t4QN/OMH3ktSdvT/7lJ/YkVgGFb4+DHm2Omi9
         DZu7SBcagsfLA==
Date:   Sun, 21 Feb 2021 12:29:55 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 2/7] HID: lenovo: Fix lenovo_led_set_tp10ubkbd()
 error handling
Message-ID: <20210221122955.2f933b14@kernel.org>
In-Reply-To: <20210221112005.102116-3-hdegoede@redhat.com>
References: <20210221112005.102116-1-hdegoede@redhat.com>
        <20210221112005.102116-3-hdegoede@redhat.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>
