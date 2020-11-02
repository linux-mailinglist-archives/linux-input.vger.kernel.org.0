Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768832A2C42
	for <lists+linux-input@lfdr.de>; Mon,  2 Nov 2020 15:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725798AbgKBOD5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Nov 2020 09:03:57 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:43526 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbgKBOD5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Nov 2020 09:03:57 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A2DwnIv148124;
        Mon, 2 Nov 2020 14:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=t3b9EEDagkqC+ehJYtKBl08r7vml+Kp06EHE6bmsJFo=;
 b=KGep6e7395sdwP35xcfweaBoJPUWj1yT9mmuouEsfECiSukNCMMvHmHHf6cvT/Bkm080
 ZvmUt4qJFT+dVtTzeiOAx6k1hl3WaO4zkcRq1FP4BLUpFsws02+JPsLWOjwUX18XPXVZ
 imdM4yIwfsQA+kvStCCIxks7ypKWI/Z04oa6cLWhMJ51yvVrbWBAtBtNJZRFoBYDZDXR
 CBReqljqQ1rdaW93QgrAkR+6UxM6s0zwK+nN7s8WneULErdLNKkkqIw9nX1MVeEuCsBw
 q6caefuGouD2mAYvfEV+bFqfB+TbRRZOulDolPvn6xz2Za6h602pzPGX3lO7meWFvQmN eg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 34hhw2c1hc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 02 Nov 2020 14:03:54 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A2DxeYt184985;
        Mon, 2 Nov 2020 14:01:54 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 34hvrtwfye-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Nov 2020 14:01:54 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0A2E1rwk007028;
        Mon, 2 Nov 2020 14:01:53 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 02 Nov 2020 06:01:52 -0800
Date:   Mon, 2 Nov 2020 17:01:47 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     sandeep.singh@amd.com
Cc:     linux-input@vger.kernel.org
Subject: [bug report] SFH:Transport Driver to add support of AMD Sensor
 Fusion Hub (SFH)
Message-ID: <20201102140147.GA41810@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9792 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=10 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011020111
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9792 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 suspectscore=10 clxscore=1011 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011020111
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Sandeep Singh,

The patch 4b2c53d93a4b: "SFH:Transport Driver to add support of AMD
Sensor Fusion Hub (SFH)" from Oct 10, 2020, leads to the following
static checker warning:

	drivers/hid/amd-sfh-hid/amd_sfh_client.c:222 amd_sfh_hid_client_init()
	warn: '&cl_data->work.timer' not released on lines: 202,222.

drivers/hid/amd-sfh-hid/amd_sfh_client.c
   134  int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
   135  {
   136          struct amdtp_cl_data *cl_data = privdata->cl_data;
   137          struct amd_mp2_sensor_info info;
   138          struct device *dev;
   139          u32 feature_report_size;
   140          u32 input_report_size;
   141          u8 cl_idx;
   142          int rc, i;
   143  
   144          dev = &privdata->pdev->dev;
   145          cl_data = kzalloc(sizeof(*cl_data), GFP_KERNEL);
   146          if (!cl_data)
   147                  return -ENOMEM;
   148  
   149          cl_data->num_hid_devices = amd_mp2_get_sensor_num(privdata, &cl_data->sensor_idx[0]);
   150  
   151          INIT_DELAYED_WORK(&cl_data->work, amd_sfh_work);
   152          INIT_DELAYED_WORK(&cl_data->work_buffer, amd_sfh_work_buffer);

I think the INIT_DELAYED_WORK() allocates a bunch of debug stuff but I'm
not 100% positive...  Maybe there is nothing to free.  Does anyone know?

   153          INIT_LIST_HEAD(&req_list.list);
   154  
   155          for (i = 0; i < cl_data->num_hid_devices; i++) {
   156                  cl_data->sensor_virt_addr[i] = dma_alloc_coherent(dev, sizeof(int) * 8,
   157                                                                    &cl_data->sensor_phys_addr[i],
   158                                                                    GFP_KERNEL);
   159                  cl_data->sensor_sts[i] = 0;
   160                  cl_data->sensor_requested_cnt[i] = 0;
   161                  cl_data->cur_hid_dev = i;
   162                  cl_idx = cl_data->sensor_idx[i];
   163                  cl_data->report_descr_sz[i] = get_descr_sz(cl_idx, descr_size);
   164                  if (!cl_data->report_descr_sz[i]) {
   165                          rc = -EINVAL;
   166                          goto cleanup;
   167                  }
   168                  feature_report_size = get_descr_sz(cl_idx, feature_size);
   169                  if (!feature_report_size) {
   170                          rc = -EINVAL;
   171                          goto cleanup;
   172                  }
   173                  input_report_size =  get_descr_sz(cl_idx, input_size);
   174                  if (!input_report_size) {
   175                          rc = -EINVAL;
   176                          goto cleanup;
   177                  }
   178                  cl_data->feature_report[i] = kzalloc(feature_report_size, GFP_KERNEL);
   179                  if (!cl_data->feature_report[i]) {
   180                          rc = -ENOMEM;
   181                          goto cleanup;
   182                  }
   183                  cl_data->input_report[i] = kzalloc(input_report_size, GFP_KERNEL);
   184                  if (!cl_data->input_report[i]) {
   185                          rc = -ENOMEM;
   186                          goto cleanup;
   187                  }
   188                  info.period = msecs_to_jiffies(AMD_SFH_IDLE_LOOP);
   189                  info.sensor_idx = cl_idx;
   190                  info.phys_address = cl_data->sensor_phys_addr[i];
   191  
   192                  cl_data->report_descr[i] = kzalloc(cl_data->report_descr_sz[i], GFP_KERNEL);
   193                  if (!cl_data->report_descr[i]) {
   194                          rc = -ENOMEM;
   195                          goto cleanup;
   196                  }
   197                  rc = get_report_descriptor(cl_idx, cl_data->report_descr[i]);
   198                  if (rc)
   199                          return rc;
                                ^^^^^^^^^^
This should "goto cleanup"


   200                  rc = amdtp_hid_probe(cl_data->cur_hid_dev, cl_data);
   201                  if (rc)
   202                          return rc;
                                ^^^^^^^^^^
Same

   203                  amd_start_sensor(privdata, info);
   204                  cl_data->sensor_sts[i] = 1;
   205          }
   206          privdata->cl_data = cl_data;
   207          schedule_delayed_work(&cl_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
   208          return 0;
   209  
   210  cleanup:
   211          for (i = 0; i < cl_data->num_hid_devices; i++) {
   212                  if (cl_data->sensor_virt_addr[i]) {
   213                          dma_free_coherent(&privdata->pdev->dev, 8 * sizeof(int),
   214                                            cl_data->sensor_virt_addr[i],
   215                                            cl_data->sensor_phys_addr[i]);
   216                  }
   217                  kfree(cl_data->feature_report[i]);
   218                  kfree(cl_data->input_report[i]);
   219                  kfree(cl_data->report_descr[i]);
   220          }
   221          kfree(cl_data);
   222          return rc;
   223  }

regards,
dan carpenter
