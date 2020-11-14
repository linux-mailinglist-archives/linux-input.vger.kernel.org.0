Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24D9C2B30FE
	for <lists+linux-input@lfdr.de>; Sat, 14 Nov 2020 22:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgKNVVI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Nov 2020 16:21:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21997 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726230AbgKNVVI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Nov 2020 16:21:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605388867;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=1Fu90/tTTJTO5qKCP9urEH0/ouXpJqGRKkcYusgqVsQ=;
        b=g1M0cLtBWow0EtEOvUaExYXmfcUZoBdwXgBUeaVSmIWNleD75Qxknahu8RMsA1KsCmK6zh
        AGDjqvWb8py8G484St46gSa10l5Xgr4/8O33gylOnmIr1bgvRkkZJNLQ+Lp30vqBdcxyAm
        DXqIo8NRIBRjekB9BIookbW2R6Ep3SQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-4M_TDqAaPbqdhWr0EhA4Wg-1; Sat, 14 Nov 2020 16:21:05 -0500
X-MC-Unique: 4M_TDqAaPbqdhWr0EhA4Wg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D9611007465;
        Sat, 14 Nov 2020 21:21:04 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-23.ams2.redhat.com [10.36.112.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E749319D6C;
        Sat, 14 Nov 2020 21:20:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [RFC 0/3] HID: logitech-dj: Dinovo keyboard fixes and improvements
Date:   Sat, 14 Nov 2020 22:20:55 +0100
Message-Id: <20201114212058.19590-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

Here is my patch series for the discussed Dinovo keyboard (receiver)
support improvements.

I've marked this as a RFC since it has not been tested with a Dinovo Mini
(nor a Dinovo Mini receiver) yet.

I have tested it extensively with a Dinovo Edge, a MX5000 and a MX5500
keyboard. In case of the Dinovo Edge and MX5000 I've not only tested
them against their own receiver but also against each-others receiver.

Once you have tested this series on your Dinovo Mini, it is ready to
go upstream. The first patch should probably go to 5.10 as a fix in
case someone pairs the Dinovo Mini with a MX5x00 receiver like the
reporter of this bug did with his Dinovo Edge:
https://bugzilla.redhat.com/show_bug.cgi?id=1811424

The other 2 are 5.11 material.

Regards,

Hans


