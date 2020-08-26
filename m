Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 876752532D1
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 17:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgHZPGK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 11:06:10 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36549 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727814AbgHZPGJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 11:06:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598454368;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=lrQCEL26mHebZ7nMphXoFoDvyCZ92/KWVGn7KWl6q9I=;
        b=VqtOMpsj7+tIkUlcTVFVm9Sc3PvO2M0OqD73ZK4Wl3nd1zZYgnjHACmbkdxosKIJyuZyrI
        w1iuLL83jeAfgAeXv5CQEINoAb9XYedc0kO2+Uk86IP+pc1dAtD4kpd9c2MUB/RShGya39
        Ihaw9WWrmT/ZNwnu6b4c4VQOw7HW6lY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-racxGtH4PTyreUSzOlOc1Q-1; Wed, 26 Aug 2020 11:06:04 -0400
X-MC-Unique: racxGtH4PTyreUSzOlOc1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A984610A5D80;
        Wed, 26 Aug 2020 15:06:03 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-219.ams2.redhat.com [10.36.112.219])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DE97760CC0;
        Wed, 26 Aug 2020 15:06:02 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH resend 0/2] Input: soc_button_array - Add support for INT33D3 ACPI tablet-switch device
Date:   Wed, 26 Aug 2020 17:05:59 +0200
Message-Id: <20200826150601.12137-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

These 2 patches seem to have fallen through the cracks again, hence
this resend.

Regards,

Hans

