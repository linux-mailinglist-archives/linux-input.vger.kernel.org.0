Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5B02023CA
	for <lists+linux-input@lfdr.de>; Sat, 20 Jun 2020 14:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgFTMcj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Jun 2020 08:32:39 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:54975 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727787AbgFTMcj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Jun 2020 08:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592656357;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=9hkqlU95yC7SKMUJxfynq09PFbEEiV9V9lu/4BLQlDk=;
        b=LJzb6ajqptlJeacgIDixzkWgGGkfLIUKcSZS5J6LkjGUNHSq3AIKd2KeBXVbGinB8ajQhc
        ZHYTeRVlxrIZq79ARMf2ny3HLk6vUnTAKm04zqWAxEylGqErg4kA5z1WIM1hnc3EDHMUq4
        QUv0RnVeGxux7Ooz1ua/uKmHxc7CZIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-NCwLU6kqME61XmkNoOEPKw-1; Sat, 20 Jun 2020 08:32:35 -0400
X-MC-Unique: NCwLU6kqME61XmkNoOEPKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9BC7A0BD7;
        Sat, 20 Jun 2020 12:32:33 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-42.ams2.redhat.com [10.36.112.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 58EC37167A;
        Sat, 20 Jun 2020 12:32:30 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH resend 0/1] HID: apple: Disable Fn-key key-re-mapping on clone keyboards
Date:   Sat, 20 Jun 2020 14:32:28 +0200
Message-Id: <20200620123229.40402-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

This one seems to have fallen through the cracks, hence this resend.

Regards,

Hans

