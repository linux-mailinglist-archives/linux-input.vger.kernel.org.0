Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55293459720
	for <lists+linux-input@lfdr.de>; Mon, 22 Nov 2021 23:06:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbhKVWJt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Nov 2021 17:09:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43639 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231256AbhKVWJs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Nov 2021 17:09:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637618801;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=xG+tmvlKjkWhyyT698eBimZapEE7HtBsdJEoevZAF8o=;
        b=LMWS7wcNB2jVaYlZPhtLF26OidTHEIUgqOx71/8LIESyDVZf6iZ2EDln8w+sq0OSiIRoNk
        hRNUeBiQT+IfVjHzvko0iD+8FwJVbRPoYVLZs63vZCr49e2T7/RWmpueno/73yPWqBug7S
        O6CsEfc4eBly7eptOdZbkxbwSIG28rw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-IFR0ZmUJP0Kki7lZDQuoSA-1; Mon, 22 Nov 2021 17:06:40 -0500
X-MC-Unique: IFR0ZmUJP0Kki7lZDQuoSA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4163E19251A3;
        Mon, 22 Nov 2021 22:06:39 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.226])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7846C57CD3;
        Mon, 22 Nov 2021 22:06:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH resend 0/2] Input: silead - Pen support
Date:   Mon, 22 Nov 2021 23:06:35 +0100
Message-Id: <20211122220637.11386-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

This series seems to have fallen through the cracks, so here
is a resend of this series.

Regards,

Hans


Hans de Goede (2):
  Input: silead - Add support for EFI-embedded fw using different
    min/max coordinates
  Input: silead - Add pen support

 drivers/input/touchscreen/silead.c | 177 ++++++++++++++++++++++++++++-
 1 file changed, 172 insertions(+), 5 deletions(-)

-- 
2.33.1

