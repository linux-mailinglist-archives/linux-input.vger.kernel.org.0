Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D576287351
	for <lists+linux-input@lfdr.de>; Thu,  8 Oct 2020 13:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbgJHL0d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Oct 2020 07:26:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45248 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726065AbgJHL0d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Oct 2020 07:26:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602156392;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=o8bi9RuZhQG81j7QlV2jRdpoHjLoe/sVPgVyO5MDPA4=;
        b=ROTDh/96GgVlr8BuWI+akI5STXL5ffXCo7LyCKg9RYlF16PmXju9zM9OHT1w4HM+mVneo7
        fIDx8BPpBs0UavjD4dFn3UEsYqcnkZmBJpA3Y/KdcktNhce0tlkXoJhNz+pcJ9Nq9dWQJd
        j027Mpo6AFxIVRNK2SZDjIvy2wpDXnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-YX5rYDtwNOmz7dkDfg95Vw-1; Thu, 08 Oct 2020 07:26:31 -0400
X-MC-Unique: YX5rYDtwNOmz7dkDfg95Vw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EB5287950B;
        Thu,  8 Oct 2020 11:26:30 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-134.ams2.redhat.com [10.36.112.134])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 221F45C1C4;
        Thu,  8 Oct 2020 11:26:28 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH resend 0/1] Input: i8042 - Allow insmod to succeed on devices without an i8042 controller
Date:   Thu,  8 Oct 2020 13:26:27 +0200
Message-Id: <20201008112628.3979-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

This one seems to have fallen through the cracks, hence this resend.

Regards,

Hans

