Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F03C1214889
	for <lists+linux-input@lfdr.de>; Sat,  4 Jul 2020 22:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbgGDULM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Jul 2020 16:11:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52638 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726643AbgGDULL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Jul 2020 16:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593893469;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=TFljwLEsteo7QV9BXNE/N+y7s304KrqF2gpwqEFYm+o=;
        b=a+/Ple9Yl/cWMg61GYewJS/7+BtBnRyIiPXh/0TpSuBi/AwTFPtBfIwTDaVnXV4KXxIWRB
        jqYo9bxv8AZk28aVAUG9nxQMH+lq/GN4xVm5AUnIyoTQjyH6CQmQQbqAVTZfwl3cs4Ti9N
        NrDxtvdQioRnOt2tH42VDTU/+h8W09w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-MqU1aRqzNAqksFsXc2t0Bg-1; Sat, 04 Jul 2020 16:11:05 -0400
X-MC-Unique: MqU1aRqzNAqksFsXc2t0Bg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C55D4800FE9;
        Sat,  4 Jul 2020 20:11:04 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 18DD173FED;
        Sat,  4 Jul 2020 20:11:00 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 0/1] HID: lenovo: Fix spurious F23 key press report during resume
Date:   Sat,  4 Jul 2020 22:10:58 +0200
Message-Id: <20200704201059.126823-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Here is one more fix for the Thinkpad 10 Ultrabook Keyboard. This applies
on top of the "[PATCH 0/5] HID: lenovo: Add ThinkPad 10 Ultrabook Keyboard
support" series which I send out earlier today.

Regards,

Hans

