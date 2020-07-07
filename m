Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA52216A7A
	for <lists+linux-input@lfdr.de>; Tue,  7 Jul 2020 12:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgGGKh6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jul 2020 06:37:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:54376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbgGGKh6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Jul 2020 06:37:58 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 134132065F;
        Tue,  7 Jul 2020 10:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594118277;
        bh=wLuu9fMADBsEkQLziOcCSEFxMCXIeD1eUn7qdwr+7qE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=cXd/DaRBt2jebjtodRNmJfxkMgi/ozItSb0B4R8OhWx0633sbSp31glQIJno8cuCo
         HxdkvF4z+6nGiu8cPAx78iT42Qv2uZUIB9TuhKoaYBMGn8XwCRot3RzXUv2MYCjN4L
         ORde4yq5LLgbFI4mZHdaDCUsYFS6bObfTM0eS0eY=
Date:   Tue, 7 Jul 2020 12:37:55 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Mazin Rezk <mnrzk@protonmail.com>
cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] HID: logitech: Use HIDPP_RECEIVER_INDEX instead of
 0xff
In-Reply-To: <FW0Ps9vggIuA-9asmWgfQkNKSlcwuAhNfFXxK3QGSu4uJRAEykUGdoL5sbJsAlehWv__Eq4LKejp0QpxQRj5LYn5tOrVRDbjrcn3JVDGLAQ=@protonmail.com>
Message-ID: <nycvar.YFH.7.76.2007071237470.15962@cbobk.fhfr.pm>
References: <FW0Ps9vggIuA-9asmWgfQkNKSlcwuAhNfFXxK3QGSu4uJRAEykUGdoL5sbJsAlehWv__Eq4LKejp0QpxQRj5LYn5tOrVRDbjrcn3JVDGLAQ=@protonmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 5 Jul 2020, Mazin Rezk wrote:

> Some parts of hid-logitech-dj explicitly referred to 0xff for the
> receiver index. This patch changes those references to the
> HIDPP_RECEIVER_INDEX definition.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

