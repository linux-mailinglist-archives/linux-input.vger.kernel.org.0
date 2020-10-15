Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C25C28F410
	for <lists+linux-input@lfdr.de>; Thu, 15 Oct 2020 15:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730385AbgJON54 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Oct 2020 09:57:56 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.1]:44230 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730367AbgJON5z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Oct 2020 09:57:55 -0400
Received: from [100.112.129.197] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-a.us-west-2.aws.symcld.net id 6A/97-41117-165588F5; Thu, 15 Oct 2020 13:57:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDIsWRWlGSWpSXmKPExsWSLveKTTchtCP
  e4PYdI4tD5w4wWxxe9ILR4uu32+wWb45PZ7I4c3shk8XNT99YLVbvecHswO4xq6GXzWPnrLvs
  Hr+2rWHxWH5wGpPH+31X2Tw+b5ILYItizcxLyq9IYM04+raDpeAUR8X3LfuYGxhb2bsYuTiEB
  P4zSqye94q5i5ETyHnNKHH+awyIzSagLbFlyy+2LkYODhEBGYkPaz1B6pkFbjNKPN/VwAZSIy
  xgLrFg/mOwXhYBVYnOM9sYQWxeARuJs5u6wGwJAXmJp73LwWo4gWrOdD1mgdilInH/wRI2iHp
  BiZMzn4DFmYHqm7fOZoawJSQOvnjBDDPn75MnrBB2gsSyl3eYJzAKzELSPgtJ+ywk7QsYmVcx
  micVZaZnlOQmZuboGhoY6BoaGukaGhvqWhrqJVbpJuqVFuuWpxaX6BrpJZYX6xVX5ibnpOjlp
  ZZsYgRGSkpBc/QOxiOvP+gdYpTkYFIS5Y0O6ogX4kvKT6nMSCzOiC8qzUktPsQow8GhJMErHg
  yUEyxKTU+tSMvMAUYtTFqCg0dJhPdQCFCat7ggMbc4Mx0idYpRUUqcdxZIQgAkkVGaB9cGSxS
  XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzBoFM4cnMK4Gb/gpoMRPQYvslLSCLSxIRUlIN
  TAXTs0X8LtucX7kv+MbFxuJ3HyvO7mIMO7/AZuO16z8fNT9j3fBug6DNxxnXr1yR+vbh63fGw
  NzfzHMOTdpX2155NEj/U8eM47fypx1Z9ftkyDz+zN3l6RfWPbMyywqZcma2nP2rKyYbglSvrN
  ZbaxzEFHqXP7XjTsj1RT1GIWYntRKOCJ9rXKh/YKu0/cM+/RuHFsefWZxS7vPfs0rzn2racv+
  VrxVaOtVY41YzxLRdZvr5Tf/4C1PmCVbBUz9HB2zc+/XX+74/E2On298JCtSQMbvP/Khkuu9O
  wzuHo9PmGxo/uio7TWW204+AsvesZ1k+by/0/7Ztmfu0hFUdna1S6lYNfy8ovQ0qNpwtvuOzE
  ktxRqKhFnNRcSIADAUHoo8DAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-18.tower-336.messagelabs.com!1602770270!83579!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29202 invoked from network); 15 Oct 2020 13:57:52 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-18.tower-336.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Oct 2020 13:57:52 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id C86D757E74028F804003;
        Thu, 15 Oct 2020 21:57:48 +0800 (CST)
Received: from localhost.localdomain.com (10.64.83.59) by
 reswpmail04.lenovo.com (10.62.32.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2044.4; Thu, 15 Oct 2020 06:57:44 -0700
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <njoshi1@lenovo.com>, <hdegoede@redhat.com>,
        <dmitry.torokhov@gmail.com>, <platform-driver-x86@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <jeff@labundy.com>,
        <anthony.wong@canonical.com>, <hadess@hadess.net>
Subject: [PATCH 0/3] Lenovo lap and palm sensor support
Date:   Thu, 15 Oct 2020 09:57:14 -0400
Message-ID: <20201015135717.384610-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.64.83.59]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch series is to add support for the Lenovo lap and palm sensors. 
The original lap sensor implementation used a sysfs API but after
consultation with the kernel maintainers we agreed on using the input
subsystem instead.
The first patch just adds the new defines needed.
The second patch adds the implementation needed for the palm sensor.
The third patch adds the implementation needed for the lap sensor. 

This means currently thinkpad_acpi.c has both the sysfs and input dev
implementations. I will add a follow-on patch to remove the sysfs
interface once I've confirmed this is OK with the few people who are
using this in user space and given them some time to migrate to the
input dev implementation.

Mark Pearson (3):
  Adding event codes for Lenovo lap and palm sensors
  Add support for Lenovo palm sensor.
  Add support for Lenovo lap sensor

 drivers/platform/x86/thinkpad_acpi.c   | 144 ++++++++++++++++++++++++-
 include/linux/mod_devicetable.h        |   2 +-
 include/uapi/linux/input-event-codes.h |   4 +-
 3 files changed, 145 insertions(+), 5 deletions(-)

-- 
2.28.0

