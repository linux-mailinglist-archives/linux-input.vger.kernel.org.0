Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC3A467909
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2019 09:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfGMHly (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Jul 2019 03:41:54 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42701 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbfGMHly (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Jul 2019 03:41:54 -0400
Received: by mail-pl1-f195.google.com with SMTP id ay6so5868961plb.9;
        Sat, 13 Jul 2019 00:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=B3YaRkPgeUC+Qq3Z6gnyCKH1F//K+FG/d8dog1iSP80=;
        b=D9ug5oFqbnqXENpwEYSE8z4/vvoV1mHJ9xAvKmP1Sp2+KS7tK9kGG6tJzvaq3aNo7d
         UxWHprV5L787QBfPBP95XDmoh0wUlrftooqY2uPCzXGO2kszbBK/UdDUi8Yngj8Bq+0M
         ZqsTHYly1O7U46FtVINcs1arh7k2MhIRU5hzicbXcODnndZa2Pnv8GGGavLWwSb/82j2
         gxY0w3VFXnZuWRQQF6ncjvj9VhaTPBr0TIhfnYgLXxNXDE3DBP7Ax64zAGctKCyS5BGO
         8CDu6/5tO+UVf4LcTZBxqgQgO+DbN8DPGz8RsX+KSS7Miy24NACdMrd3PUWiA9+BSfPq
         Lfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=B3YaRkPgeUC+Qq3Z6gnyCKH1F//K+FG/d8dog1iSP80=;
        b=VyOzoCyRqqLSzZn+5+cVPgDt8B+vNuaaBT8ZwraWBWXGdqYDu+F3/Qz9l+aHvGZMz9
         nZTudwyCHzRnDPINOQ4sV//Tav1DXXkuYmtzitVn6AWogQd31N4USmoGw5mvumsXzP6d
         I8RYJbdpz4IhgTMIrp2DDLXvLS+gv8p4qqArzDqij2eaHKYm//IaWXJP7QmG90dyCSsa
         Iqw1sL4OGWXuoQhWYsNvZu/DsyfM50FZK9nzw28CefwgFBX3300RI34BZc4P3JN2a/Nu
         vLe+lVl6comwoTLURiledJHb6kloyzaXpq/0cc541K10Fj2Hd0XvZsjoiGFcOZwq58Tc
         TWyQ==
X-Gm-Message-State: APjAAAVojbq+3quNfa/B0J083ZGOpueg8QR4plGR9CeIr53zuv2f62N0
        H40YM+cfGyDeEzPkp7KjwGpfulVX/hE=
X-Google-Smtp-Source: APXvYqzr6Z8pm/o/L9NjgUbQq5bbz9In8YVUfvbN54VMqedPZny72QtVcRpsO6ohVZdUyld3myRUqQ==
X-Received: by 2002:a17:902:7087:: with SMTP id z7mr16211926plk.184.1563003713188;
        Sat, 13 Jul 2019 00:41:53 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id q7sm14391035pff.2.2019.07.13.00.41.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 13 Jul 2019 00:41:52 -0700 (PDT)
Date:   Sat, 13 Jul 2019 00:41:50 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nate Graham <pointedstick@zoho.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: synaptics - enable RMI mode for HP Spectre X360
Message-ID: <20190713074150.GA241222@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The 2016 kabylake HP Spectre X360 (model number 13-w013dx) works much better
with psmouse.synaptics_intertouch=1 kernel parameter, so let's enable RMI4
mode automatically.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=204115
Reported-by: Nate Graham <pointedstick@zoho.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 7f8f4780b511..c0e188cd3811 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -182,6 +182,7 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN2055", /* E580 */
 	"SYN3052", /* HP EliteBook 840 G4 */
 	"SYN3221", /* HP 15-ay000 */
+	"SYN323d", /* HP Spectre X360 13-w013dx */
 	NULL
 };
 

-- 
Dmitry
