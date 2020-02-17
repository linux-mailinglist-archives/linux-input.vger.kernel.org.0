Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A83B161609
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2020 16:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgBQPYr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Feb 2020 10:24:47 -0500
Received: from www149.your-server.de ([78.47.15.70]:33306 "EHLO
        www149.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgBQPYr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Feb 2020 10:24:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hanno.de;
         s=default1911; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=kwxIYXO9ZQLxZYLWCibVPzyp30EQ5TPRFr5H4jfiVTI=; b=JLTbFHMrzb0U/YZo+Q2GX34SRM
        8/DeFYvH+bgrA6GDjZ/ATzJ4wnXfrdOX6I2m6tOZxCJa7T+NPbUuO94BICoBeAHETxx65yfJYoj1S
        BiwmYZ7ieysCJvj+xcJMeuA9z/qHajM7rv4ZaTRgRxl0y9YU/StytnAGklintSrSUHkl+Pj/yYXnC
        mR/WYuIoOPOqUw/SKF2JPCawaTdoQso/OpT/OUK33SDznwQNilxi+EqzOatiYfTJ68ohBgN0j1FLi
        nMbkYK68SRiR55Vl/qmTtYL5ee7m4uPLRbLVIzqfK8FVC0gbKyL9H0z38ZccAhkxApE0k4fGLfUU3
        N3J+0pGQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www149.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <abos@hanno.de>)
        id 1j3iGH-0004g8-J2; Mon, 17 Feb 2020 16:24:41 +0100
Received: from [62.96.7.134] (helo=[10.1.0.41])
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <abos@hanno.de>)
        id 1j3iGH-0002Cx-Fs; Mon, 17 Feb 2020 16:24:41 +0100
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Hanno Zulla <abos@hanno.de>
Subject: [PATCH 0/3] HID: hid-bigbenff: fixing three crash bugs in a gamepad
 driver
Message-ID: <ae5eee33-9dfc-0609-1bf8-33fd773b9bd5@hanno.de>
Date:   Mon, 17 Feb 2020 16:24:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: abos@hanno.de
X-Virus-Scanned: Clear (ClamAV 0.102.1/25726/Mon Feb 17 15:01:07 2020)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi there,

the hid-bigbenff.c had three bugs causing possible kernel crashes.

The first patch fixes a double free during device removal, which was 
caused by a wrong use of input_ff_create_memless(). The 
"driver-specific data to be passed into play_effect" parameter of 
input_ff_create_memless() would later be freed automatically when the ff 
device is removed. Since the driver also uses the managed resource API, 
it would automatically free the memory of this parameter twice, causing 
a general protection fault moments later.

The second patch fixes the error path after hid_hw_start(), as a call 
to hid_hw_stop() is required in case of an error.

The second patch also removes the hid_hw_close() call during device 
removal, as several other hid device drivers don't call this routine, 
either.

The third patch adds a flag to avoid a race condition when there is 
still scheduled work left (or newly being scheduled) during or after 
device removal, which could cause a kernel crash.

Thanks in advance for your review & kind regards,

Hanno
