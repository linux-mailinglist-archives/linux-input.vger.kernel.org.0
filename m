Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3000395035
	for <lists+linux-input@lfdr.de>; Sun, 30 May 2021 11:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbhE3JNx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 30 May 2021 05:13:53 -0400
Received: from outgoing-yousee.gl-mut-gbl.as8677.net ([193.201.76.59]:26247
        "EHLO outgoing-yousee.gl-mut-gbl.as8677.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229500AbhE3JNw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 30 May 2021 05:13:52 -0400
X-Greylist: delayed 511 seconds by postgrey-1.27 at vger.kernel.org; Sun, 30 May 2021 05:13:52 EDT
Received: from filter.yousee.as8677.net (localhost [127.0.0.1])
        by mwumf0303.yousee.as8677.net (SMTP Server) with ESMTP id 4FtCC30L9Zz4Lb
        for <linux-input@vger.kernel.org>; Sun, 30 May 2021 11:03:43 +0200 (CEST)
X-mail-filterd: {"version":"1.2.1","queueID":"4FtCC305CLz4Ln","contextId":"e9500567-dba0-4cef-bc4f-d3225fe91203"}
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=webspeed.dk; s=sela;
 t=1622365423; h=Subject:From:To:Date; bh=zPKMEgwnMLDuafWuaoYr+QbjVv1nnHSqnNfo
  vMJ2Wxk=; b=obolJWgYLrxha7poYAGw8x7WuVbCI2tCQXNNjSz6EB+JjPevtjookOlbeUJDfYLE
  zJ1Sn9lJDoA8KBykaopWhOBAyqQSjaShvyUTgunBRPZ8NDdjIFpTFPqp20mgu99W/3wenvJvK5ho
  if0TExeA6raYJhk+v5X8rWJBcoac8TowNW38WcopgL9j6bhxaJtVWJ26yyNNUsM7s9i3sMGprscn
  LVBfOj4UIoE/xE5b93dyZPyIGJgOlXzQKDCltGkRmvauyMzqcvIvdiiNIRdSExd7qDD6f5Va4dsv
  Dbhvdc9Tr5hhZdppaKqj4j8TI0JrtKaocGBJykMUoBYo4SxIJw==
Received: from outgoing-yousee.gl-mut-gbl.as8677.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mwumf0303.yousee.as8677.net (SMTP Server) with ESMTPS id 4FtCC305CLz4Ln
        for <linux-input@vger.kernel.org>; Sun, 30 May 2021 11:03:43 +0200 (CEST)
X-mail-filterd: {"version":"1.2.1","queueID":"4FtCC25nNZz4Lb","contextId":"f3b49dcc-b45d-45f9-8242-41f8720a2eff"}
X-yse-mailing: LEGIT
X-yse-spamrating: 50
X-yse-spam: not-spam
X-yse-spamcause: OK, (50)(0000)gggruggvucftvghtrhhoucdtuddrgeduledrvdeluddgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvfffvedpggftfgfpufgfuefuveftkfeugfdpqfgfvfenuceurghilhhouhhtmecufedttdenucgovfgvgihtqfhnlhihqddqteefjeefqddtgeculdehtddmnecujfgurhepkffuhffvffgtfggggfesthejredttderjeenucfhrhhomhepjfgrnhhsucfutghhuhhlthiiuceohhgrnhhsrdhstghhuhhlthiiseifvggsshhpvggvugdrughkqeenucggtffrrghtthgvrhhnpeekjeehkeefheetleeghfelieethfevheeftdffiefgledvueegjeegjeejffehkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrddutdegrdduudeirddukeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplgduledvrdduieekrddurddvfeegngdpihhnvghtpedvrddutdegrdduudeirddukeegpdhmrghilhhfrhhomhephhgrnhhsrdhstghhuhhlthiiseifvggsshhpvggvugdrughkpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Received: from [192.168.1.234] (2-104-116-184-cable.dk.customer.tdc.net [2.104.116.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: hans.schultz@webspeed.dk)
        by mwumf0303.yousee.as8677.net (SMTP Server) with ESMTPSA id 4FtCC25nNZz4Lb
        for <linux-input@vger.kernel.org>; Sun, 30 May 2021 11:03:42 +0200 (CEST)
Authentication-Results: yousee.as8677.net; auth=pass (PLAIN) smtp.auth=hans.schultz@webspeed.dk
Message-ID: <f35f6472fddcf552076f40190f8f1d74888d0b4a.camel@webspeed.dk>
Subject: Elantech touchpad not working on mainline kernels
From:   Hans Schultz <hans.schultz@webspeed.dk>
To:     linux-input@vger.kernel.org
Date:   Sun, 30 May 2021 11:02:40 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,
I have a problem getting my Elantech touchpad to work with the mainline
kernels, and I need some assistance with the code to resolve the
problem.
The kernels that have tried are 5.9.11 and 5.11.11.

With boot parameters i8042.notimeout i8042.nomux, the touchpad is
detected but does not work. There is absolutely no response from it
with any hid modules loaded.

It is reported and seen working on a Lubuntu distro (bionic kernel)
when inserting the i2c_hid module. The insertion of the i2c_hid module
pulls in the hid_multitouch module when it works, no boot parameters
necessary.
In the case where it does not work, insering the i2c_hid module does
not pull in the hid_multitouch module.

I have the bionic kernel code, but I have not as of yet been able to
detect what makes it work in contrast to the kernel.org kernels.

This I think should lead to a kernel patch.

TIA,
Hans Schultz
