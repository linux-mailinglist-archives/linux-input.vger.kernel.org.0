Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 773E43421F9
	for <lists+linux-input@lfdr.de>; Fri, 19 Mar 2021 17:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhCSQdl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Mar 2021 12:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbhCSQdR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Mar 2021 12:33:17 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000D3C06174A
        for <linux-input@vger.kernel.org>; Fri, 19 Mar 2021 09:33:16 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id j3so11475313edp.11
        for <linux-input@vger.kernel.org>; Fri, 19 Mar 2021 09:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YE7uFy2N7j2Ja5TOSYdTQkiwcsHL4N5yY1QGWWdXy10=;
        b=He38tQ+fy+Wx6K56wVxIevmoLGX/xBZoYyKZa3qarQu2hGw9a+mQ2JtflCP4/K2dHm
         7gRA1mOuuCqmKSJfyWSRTfXO2XGmTpvSesE0hAea6l0XTdO1gT1AfKAwByIoU4GV7nUg
         r0H6hScisRGfe+wLE98b1Yr7XLCOvLUTY1Mga1C3sHZKNnmDl6Hqw9fFyxiIEky2CtDg
         vn6qh5MMlu0nbvDRDqgw+RwO370oDAhR+rH2JF2h58TxAQpVLw9/b3OkhRkEMn2k/9N7
         EdEtye9rT1KB12J1ePdYeSJkbrpRGxRgefLPJvO0ocOF6uwDRj97sWymvCxuLFV98aK6
         8Zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YE7uFy2N7j2Ja5TOSYdTQkiwcsHL4N5yY1QGWWdXy10=;
        b=Yl/bk9FHHYezgac/x3w3xDLrT7BKV/FMAF0UDNslizR7MQTesWgGlLANxJZ2RK+6HG
         nqRGRhMJ3IwzIrSbL+vmVd43opgKlY+UqSJsMzrBx3c32YZKIJ2IvTbQm0jCmO/xGQz2
         +7XcQgdfkWgHWwvQ/tI1axEjZy+J8C6Jp76smXvuWHi+nxHCzmFKZG0/Ve8IOkGzXo8i
         IhQghF8dQJvr4uFZ5LR+fZFXDRzuY1Z0ODVj8UFBSlF3e24wIDyxl8hhsqmrd3Iv+kdl
         xOSMd+SXmjIIuE3zl7iwyR9+iGkaYwWzDV0mAhqpCX8LMePcZfc4Qub6bsQMbNiQilY/
         snaA==
X-Gm-Message-State: AOAM532t5floxHJsbWpGa86V45Q8xZhDOh7pc7fRGglLeSlIdIREPO99
        XnQxjVq9KgN39cw6i1e5mrM=
X-Google-Smtp-Source: ABdhPJzWSXhZyoGiCE8yRQcYAIrGDHZ1p4QMBMo2rB4CU3kpG29c82lAJP7541RbezjCx1JIgpKJ8Q==
X-Received: by 2002:aa7:cd64:: with SMTP id ca4mr10421890edb.334.1616171595500;
        Fri, 19 Mar 2021 09:33:15 -0700 (PDT)
Received: from michael-VirtualBox (cbl217-132-244-50.bb.netvision.net.il. [217.132.244.50])
        by smtp.gmail.com with ESMTPSA id kj3sm3960809ejc.117.2021.03.19.09.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 09:33:15 -0700 (PDT)
Date:   Fri, 19 Mar 2021 18:33:12 +0200
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [bug report] HID: ft260: add usb hid to i2c host bridge driver
Message-ID: <20210319163312.GA1940@michael-VirtualBox>
References: <YFMt+VFuiZlCVFyP@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFMt+VFuiZlCVFyP@mwanda>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 18, 2021 at 01:39:53PM +0300, Dan Carpenter wrote:
> 
> drivers/hid/hid-ft260.c
>   1017  static int ft260_raw_event(struct hid_device *hdev, struct hid_report *report,
>   1018                             u8 *data, int size)
>   1019  {
>   1020          struct ft260_device *dev = hid_get_drvdata(hdev);
>   1021          struct ft260_i2c_input_report *xfer = (void *)data;
>   1022  
>   1023          if (xfer->report >= FT260_I2C_REPORT_MIN &&
>   1024              xfer->report <= FT260_I2C_REPORT_MAX) {
>   1025                  ft260_dbg("i2c resp: rep %#02x len %d\n", xfer->report,
>   1026                            xfer->length);
>   1027  
>   1028                  memcpy(&dev->read_buf[dev->read_idx], &xfer->data,
>   1029                         xfer->length);
> 
> Do we need to check if "xfer->len <= dev->read_len"?
The dev->read_len is a total length to be read, passed into ft260_i2c_read()
by a user. This length is divided into 60 bytes chanks to be retrieved from
the ft260 controller. The ft260_raw_event() receives these chanks and counts
the total number of bytes received in read_idx. Once it matches the read_len,
we conclude on the i2c read transfer completion. We do not need to check the
xfer->len against the dev->read_len since the ft260 controller never returns
more bytes than was asked to read.
> 
>   1030                  dev->read_idx += xfer->length;
>   1031  
>   1032                  if (dev->read_idx == dev->read_len)
>   1033                          complete(&dev->wait);
>   1034  
>   1035          } else {
>   1036                  hid_err(hdev, "unknown report: %#02x\n", xfer->report);
>   1037                  return 0;
>   1038          }
>   1039          return 1;
>   1040  }
> 
> regards,
> dan carpenter
