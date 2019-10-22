Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4785FE0CD9
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 21:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732790AbfJVT41 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 15:56:27 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39508 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731436AbfJVT41 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 15:56:27 -0400
Received: by mail-pf1-f196.google.com with SMTP id v4so11295023pff.6;
        Tue, 22 Oct 2019 12:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AhGbxlKBv9w4Kj97sMwogllkiROgb8NfSw8xTrMLvlE=;
        b=YWUszLASSAzfQwI5DKumAGSnbGSyA3aFD4sVK2Wk6Pysx/Y45fT28ZEmE/6dv0hsh5
         NELdUeGXsYhJx3eDJqd8XHbJOTgvBzzkJSQ0tqOb0olzOY1m3qcm3jHRbOViXfElxHpy
         LT1ofIOHgS+PlNwB6kJeApYrIwoyLee/4CI9x5edkxPZ/QBhQCGleNdUij9mW9Nk5pUE
         JXHLvEeLdExPa/lBTG38UrclvdjJ+ZwQcQS188v3jKhsgde5wgZiIq8ZVdWwkBZ7Ndbz
         NOU2FuGuqQYwQ4T9RcyV7ebdGWinJta/eCwNcvnpO4TzzvTtzOvYhmPt4Y8JBsPyox0e
         xeag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AhGbxlKBv9w4Kj97sMwogllkiROgb8NfSw8xTrMLvlE=;
        b=nHBexXPZz6PLxExRvIHgqJKMazgIDvt/w9ReX87AyU8loz5fc60LRxGv3VqNR921UD
         c8Sbb/vll+vYgS3HO1s2F14Z4yO9JuOO4bqyGuGrVGHQfu+UQQAAv+xY5C44IQ0dmGQ/
         wrY+IxKQqkJpVaQ5o2oRt0LBHrQj7EuqksVqH6TJqiQ2RCZ3boNHzpK05BfoGCmfnYeh
         5HqBz6CRG6iYMnD/e0eK569cJllQsotT9iS3Wx9Z+EkQ88AxWoTt9CMcIVjaHp+AVDwG
         KqHH6FbQqoeCVUeW4Oq1cCwoc9/mZQAdYWb/wrhkRfKbBfy3GRqH+1gbOZdhcGqRoupU
         qTqQ==
X-Gm-Message-State: APjAAAWUCJ9PsYr+nciR04HQZCtzd8z3q/0UfJUEFPKfEjnn39eaw1t3
        ubxX/wx2rMYUe+xA7GEgXYAOmLJo
X-Google-Smtp-Source: APXvYqysAhTXSOU4gzsqC+vlDH2yS6SQ9QH+4uUKD0usayIW8EnQ57nCBifgW1ok/Exrj+v/0wJxBw==
X-Received: by 2002:a63:da04:: with SMTP id c4mr5589680pgh.172.1571774186023;
        Tue, 22 Oct 2019 12:56:26 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c34sm20212715pgb.35.2019.10.22.12.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 12:56:25 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Martin Kepplinger <martink@posteo.de>
Cc:     Dixit Parmar <dixitparmar19@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Matthias Fend <matthias.fend@wolfvision.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] Face lift for st1232 touchscreen driver
Date:   Tue, 22 Oct 2019 12:56:14 -0700
Message-Id: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series cleans up the driver and switches it over to the slotted
multi-touch protocol (MT-B) that should reduce the traffic between kernel
and userspace.

Note that I do not have hardware, so I would appreciate if you could try
running it and tell me if it is broken or not.

Thanks!


Dmitry Torokhov (8):
  Input: st1232 - simplify parsing of read buffer
  Input: st1232 - do not unconditionally configure as wakeup source
  Input: st1232 - rely on I2C core to configure wakeup interrupt
  Input: st1232 - do not reset the chip too early
  Input: st1232 - do not allocate fingers data separately
  Input: st1232 - do not set parent device explicitly
  Input: st1232 - note that the receive buffer is DMA-safe
  Input: st1232 - switch to using MT-B protocol

 drivers/input/touchscreen/st1232.c | 184 ++++++++++++++---------------
 1 file changed, 89 insertions(+), 95 deletions(-)

-- 
2.23.0.866.gb869b98d4c-goog

