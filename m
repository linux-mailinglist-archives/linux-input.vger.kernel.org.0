Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C61C4575A
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 10:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbfFNIUf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 04:20:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46280 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725907AbfFNIUf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 04:20:35 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id DD3F0308339E;
        Fri, 14 Jun 2019 08:20:34 +0000 (UTC)
Received: from shalem.localdomain.com (unknown [10.36.118.15])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7199E60BE2;
        Fri, 14 Jun 2019 08:20:29 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 0/1] HID: logitech-dj: Fix forwarding of very long HID++ reports
Date:   Fri, 14 Jun 2019 10:20:26 +0200
Message-Id: <20190614082027.4270-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Fri, 14 Jun 2019 08:20:34 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri, Benjamin,

Here is a small (and simple) fix for the new logitech-dj stuff
in 5.2. It would be nice if this can still make it into 5.2.0,
in case it doesn't I've added a fixes tag so it will get automatically
added to a 5.2.z release.

Regards,

Hans

